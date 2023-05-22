import { Body, Controller, Get, Post, Delete } from '@nestjs/common';
import { OrderService } from './orders.service';
import { Order } from './entity/order.entity';
import { ORDER_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { CreateOrderDto } from './dto/createOrderDto';

@Controller(ROUTEPATH)
export class OrderController {
  constructor(private OrderService: OrderService) {}

  @Post(ORDER_REQUEST_MAPPING.CREATE_ORDER)
  createOrder(@Body() orderDto: CreateOrderDto): Promise<Order> {
    return this.OrderService.createOrder(orderDto);
  }
  @Get(ORDER_REQUEST_MAPPING.GET_ALL_ORDERS)
  getAllOrders(): Promise<Order[]> {
    return this.OrderService.findAll();
  }
  @Get(ORDER_REQUEST_MAPPING.GET_ORDER_BY_ID)
  getOrderById(id: string): Promise<Order| null> {
    return this.OrderService.findById(id);
  }
  @Delete(ORDER_REQUEST_MAPPING.REMOVE_ORDER)
  removeOrder(id: string): Promise<void> {
    return this.OrderService.remove(id);
  }
}
