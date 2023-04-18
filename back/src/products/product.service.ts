import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Product } from './entity/product.entity';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private productsRepository: Repository<Product>,
  ) {}

  getPing(): string {
    return 'pong';
  }

  createProduct(product: Product): Promise<Product> {
    return this.productsRepository.save(product);
  }

  findAll(): Promise<Product[]> {
    // return this.productsRepository.find();
    return;
  }

  // findOne(id: number): Promise<Product | null> {
  //   return this.productsRepository.findOne({ id });
  // }

  // async remove(id: number): Promise<void> {
  //   await this.productsRepository.delete(id);
  // }
}
