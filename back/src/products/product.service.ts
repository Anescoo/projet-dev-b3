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
    return this.productsRepository.find();
  }

  findById(id: string): Promise<Product | null> {
    return this.productsRepository.findOneBy({
      productId: id, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.productsRepository.delete(id);
  }
}
