import { Order } from './order.entity';
import { Product } from 'src/products/entity/product.entity';
export declare class OrderItem {
    id: string;
    order: Order;
    product: Product;
    orderItemsQuantity: number;
    price: number;
}
