import { OrderService } from './orders.service';
import { Order } from './entity/order.entity';
import { CreateOrderDto } from './dto/createOrderDto';
export declare class OrderController {
    private OrderService;
    constructor(OrderService: OrderService);
    createOrder(orderDto: CreateOrderDto): Promise<Order>;
    getAllOrders(): Promise<Order[]>;
    getOrderById(id: string): Promise<Order | null>;
    removeOrder(id: string): Promise<void>;
}
