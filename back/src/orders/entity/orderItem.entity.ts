import { Entity, Column, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { Order } from './order.entity';
import { Product } from 'src/products/entity/product.entity';

@Entity()
export class OrderItem {
  @PrimaryGeneratedColumn()
  id: string;

  @ManyToOne(() => Order, { onDelete: 'CASCADE' })
  order: Order;

  @ManyToOne(() => Product)
  product: Product;

  @Column()
  orderItemsQuantity: number;

  @Column({ type: 'decimal', precision: 10, scale: 2 })
  price: number;
}
