import { Repository } from 'typeorm';
import { Order } from './entity/order.entity';
import { CreateOrderDto } from 'src/orders/dto/createOrderDto';
export declare class OrderService {
    private OrdersRepository;
    constructor(OrdersRepository: Repository<Order>);
    createOrder(orderDto: CreateOrderDto): Promise<Order>;
    findAll(): Promise<Order[]>;
    findById(id: string): Promise<Order | null>;
    remove(id: string): Promise<void>;
}
