import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Order } from './entity/order.entity';
import { CreateOrderDto } from 'src/orders/dto/createOrderDto';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private OrdersRepository: Repository<Order>,
  ) {}

  createOrder(orderDto: CreateOrderDto): Promise<Order> {
    return this.OrdersRepository.save(orderDto);
  }

  findAll(): Promise<Order[]> {
    return this.OrdersRepository.find();
  }

  findById(id: string): Promise<Order | null> {
    return this.OrdersRepository.findOneBy({
      id: id, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.OrdersRepository.delete(id);
  }
}
