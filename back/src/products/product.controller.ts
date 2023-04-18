import { Controller, Get } from '@nestjs/common';
import { ProductService } from './product.service';
@Controller()
export class ProductController {
  constructor(private productService: ProductService) {}
  @Get()
  getPing(): string {
    return this.productService.getPing();
  }
}
