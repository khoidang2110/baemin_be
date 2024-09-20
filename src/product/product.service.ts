import { Injectable } from '@nestjs/common';
import { User } from 'src/decorators/user.decorator';
import { v4 as uuidv4 } from 'uuid';
import { PrismaService } from 'src/prisma/prisma.service';
import { OrderCartDTO, OrderDTO } from './dto/order.dto';
//import { Prisma } from '@prisma/client';

@Injectable()
export class ProductService {


constructor(
    private prismaService: PrismaService
){}

async getProduct() {
    let data = await this.prismaService.product.findMany({
      include: {
        category: {
          select: {
            category_name: true
          }
        },
        store: {
          select: {
            store_name: true,
            store_address: true,
            img:true
          }
        }
      }
    });
  
    return data;
  }
  

    async getCategory() {

        let data = await this.prismaService.category.findMany()
        return data;
    }

    async getProductType(categoryId) {

        let data = await this.prismaService.product.findMany({
            where: {
                category_id: categoryId
            }
        })
        return data;
    }



    async getSearch(name, page) {

        let index = (page - 1) * 5;

        let data = await this.prismaService.product.findMany({
            where: {
                product_name: {
                    contains: name, 
                mode: 'insensitive'
                }
            },
            skip: index,
            take: 5,
            include: {
              category: {
                select: {
                  category_name: true
                }
              },
              store: {
                select: {
                  store_name: true,
                  store_address: true,
                  img:true
                }
              }
            }
        })
        return data;
    }

    async createOrder(orderDto: OrderDTO) {
        return this.prismaService.$transaction(async (prisma) => {
            // Check stock for each product in the order cart
            for (const orderCartItem of orderDto.orderCart) {
                const product = await prisma.product.findUnique({
                    where: { product_id: orderCartItem.product_id },
                    select: { stock: true }
                });
    
                if (!product || product.stock < orderCartItem.quantity) {
                    throw new Error(
                        `Insufficient stock for product ID: ${orderCartItem.product_id}. Available stock: ${product?.stock}`
                    );
                }
            }
    
            // Deduct stock and create the order
            for (const orderCartItem of orderDto.orderCart) {
                await prisma.product.update({
                    where: { product_id: orderCartItem.product_id },
                    data: {
                        stock: {
                            decrement: orderCartItem.quantity, // Decrease stock
                        },
                    },
                });
            }
    
            // Generate random order ID
           // const orderId = generateRandomOrderId();
            let orderId = uuidv4();
            // Define the order data
            const newOrder = {
                order_id: orderId,
                date: new Date(),
                store_id: orderDto.store_id,
                user_id: orderDto.user_id,
                payment: orderDto.payment,
                address: orderDto.address,
                note: orderDto.note,
                fee: orderDto.fee,
                discount: orderDto.discount,
                tracking_id: 1,
            };
    
            // Create the order
            const order = await prisma.orders.create({
                data: newOrder,
            });
    
            // Create associated order carts
            const orderCarts = orderDto.orderCart.map((orderCart: OrderCartDTO) => ({
                product_id: orderCart.product_id,
                quantity: orderCart.quantity,
                order_id: order.order_id,
            }));
    
            // Insert order carts into the order_cart table
            await prisma.order_cart.createMany({
                data: orderCarts,
            });
    const order_tracking_data = {
        order_id: orderId,
        tracking_id: 1,
        active: true,
    }
    // tạo order_tracking
     await prisma.order_tracking.create({
        data: order_tracking_data,
    });


            return { message: 'successfully',data:orderId };
        });
    }
      
    async getTracking(order_id: string) {
      // Log the input order_id for debugging
      console.log('Input order_id:', order_id);
   
      // Fetch the current tracking ID from the order_tracking table for the given order_id
      const orderTracking = await this.prismaService.order_tracking.findFirst({
          where: { order_id },
          // Log the fetched orderTracking for debugging
          //select: { tracking_id: true }  // Only fetch the tracking_id
      });
   
      console.log('Fetched orderTracking:', orderTracking);
   
      if (!orderTracking) {
          return { message: "No tracking information found for the given order_id" };
      }
   
      const trackingList = await this.prismaService.tracking.findMany();
   
      console.log('Fetched trackingList:', trackingList);
   
      const activeTrackingId = orderTracking.tracking_id;
   
      const mappedTrackingList = trackingList.map(tracking => ({
          tracking_id: tracking.tracking_id,
          tracking_status: tracking.tracking_status,
          active: tracking.tracking_id === activeTrackingId
      }));
   
      console.log('Mapped tracking list:', mappedTrackingList);
   
      return mappedTrackingList;
   
  
  
    }
  
    
    async updateTracking(order_id: string, new_tracking_id: number) {
        try {
          // Find the record with the given order_id
          const existingTrackingRecord = await this.prismaService.order_tracking.findFirst({
            where: {
              order_id: order_id,
            },
          });
      
          if (existingTrackingRecord) {
            // Update the tracking_id for the found record
            await this.prismaService.order_tracking.update({
              where: {
                order_tracking_id: existingTrackingRecord.order_tracking_id, // Use the unique identifier
              },
              data: {
                tracking_id: new_tracking_id, // Update the tracking_id
              },
            });
      
            console.log('Tracking status updated successfully');
          } else {
            console.log('Tracking record not found for the given order_id');
          }
        } catch (error) {
          console.error('Error updating tracking status:', error);
        }
      }
      
      
}