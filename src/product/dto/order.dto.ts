import { IsString, IsNumber } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

// OrderDTO with an array of OrderCartDTO items
export class OrderDTO {
  date: Date;
  store_id: number;
  user_id: number;
  payment: string;
  address: string;
  note: string;
  fee: number;
  discount: number;
  tracking_id: number;

  orderCart: OrderCartDTO[];  // Add array of OrderCartDTO
}

export class OrderCartDTO {
  product_id: number;
  quantity: number;
}


export class UpdateTrackingDto {
  @ApiProperty({ description: 'Order ID', type: String })
  @IsString()
  order_id: string;

  @ApiProperty({ description: 'Tracking ID', type: Number })
  @IsNumber()
  tracking_id: number;
}