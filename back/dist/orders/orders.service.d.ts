import { Repository } from 'typeorm';
import { Order } from './entity/order.entity';
export declare class OrderService {
    private OrdersRepository;
    constructor(OrdersRepository: Repository<Order>);
    createOrder(Order: Order): Promise<Order>;
    findAll(): Promise<Order[]>;
    findById(id: string): Promise<Order | null>;
    remove(id: string): Promise<void>;
}
