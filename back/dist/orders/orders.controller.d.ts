import { OrderService } from './orders.service';
import { Order } from './entity/order.entity';
export declare class OrderController {
    private OrderService;
    constructor(OrderService: OrderService);
    createOrder(Order: Order): Promise<Order>;
    getAllOrders(): Promise<Order[]>;
    getOrderById(id: string): Promise<Order | null>;
    removeOrder(id: string): Promise<void>;
}
