import { Controller, Delete, Get, Post } from '@nestjs/common';
import { ProductService } from './product.service';
import { Product } from './entity/product.entity';
@Controller()
export class ProductController {
  constructor(private productService: ProductService) {}
  @Get()
  getPing(): string {
    return this.productService.getPing();
  }
  @Post()
  createProduct(product: Product): Promise<Product> {
    return this.productService.createProduct(product);
  }
  @Get()
  getAllProduct(): Promise<Product[]> {
    return this.productService.findAll();
  }
  @Get()
  getProductById(id: string): Promise<Product | null> {
    return this.productService.findById(id);
  }
  @Delete()
  removeProduct(id: string): Promise<void> {
    return this.productService.remove(id);
  }
}
