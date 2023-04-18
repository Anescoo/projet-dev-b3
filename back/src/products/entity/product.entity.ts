import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
//! ProductQuantity toujours positif

@Entity()
export class Product {
  @PrimaryGeneratedColumn('uuid')
  productId: string;

  @Column()
  productName: string;

  @Column({ nullable: true })
  description?: string | null;

  @Column({ type: 'decimal', precision: 10, scale: 2 })
  price: number;

  @Column({ type: 'bigint', nullable: true })
  image?: Buffer | null;

  @Column()
  productQuantity: number;
}
