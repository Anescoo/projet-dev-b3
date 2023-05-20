import { Order } from './order.entity';
import { Product } from 'src/products/entity/product.entity';
export declare class OrderItem {
    id: number;
    order: Order;
    product: Product;
    orderItemsQuantity: number;
    price: number;
}
