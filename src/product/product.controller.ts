import { Body, Controller, Get, Param, Post, Query} from '@nestjs/common';
import { ProductService } from './product.service';
import { ApiParam, ApiQuery } from '@nestjs/swagger';
import { OrderDTO ,UpdateTrackingDto} from './dto/order.dto';



import { ApiOperation, ApiResponse } from '@nestjs/swagger';

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Get("/get-all")
  getProduct(){
return this.productService.getProduct()
  }


  @Get("/get-category")
  getCategory() {
    return this.productService.getCategory()
  }

  // @Get("/get-product-type/:categoryId")
  // getDishType(@Param("categoryId") categoryId) {
  //   return this.dishService.getProductType(+categoryId)
  // }

  @Get("/get-product-type/:categoryId")
  @ApiParam({ name: 'categoryId', type: 'integer', description: 'Category ID' })
  getProductType(@Param('categoryId') categoryId: number) {
    return this.productService.getProductType(+categoryId);
  }


  @Get("/search-pagination")
  @ApiQuery({ name: 'name', type: 'string', required: false, description: 'Product name to search for' })
  @ApiQuery({ name: 'page', type: 'integer', required: false, description: 'Page number for pagination' })
  getSearch(@Query("name") name, @Query("page") page) {

    return this.productService.getSearch(name, page)
  }

// @Post('/order')
// order(
//   @Body{} order 
// )
// {
//   return this.productService.order(order)
// }


@Post('/order')
createOrder(@Body() orderDto: OrderDTO) {
  return this.productService.createOrder(orderDto);  // Pass order DTO to service
}

@Get("/tracking/:order_id")
@ApiParam({ name: 'order_id', type: 'string', description: 'order ID' })
getTracking(@Param('order_id') order_id: string) {
  return this.productService.getTracking(order_id);
}


@Post('/update_tracking')
@ApiQuery({ name: 'order_id', type: 'string', required: true, description: 'Order ID' }) 
@ApiQuery({ name: 'tracking_id', type: 'integer', required: true, description: 'Tracking ID' }) 
async updateTracking(
    @Query('order_id') order_id: string,
    @Query('tracking_id') tracking_id: number
) {
    return this.productService.updateTracking(order_id, +tracking_id);
}


}
