import { Body, Controller, Delete, Get, Post } from '@nestjs/common';
import { ProductService } from './product.service';
import { Product } from './entity/product.entity';
import { PRODUCT_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { CreateProductDto } from './dto/createProductDto';
@Controller(ROUTEPATH)
export class ProductController {
  constructor(private productService: ProductService) {}
  @Get()
  getPing(): string {
    return this.productService.getPing();
  }
  @Post(PRODUCT_REQUEST_MAPPING.CREATE_PRODUCT)
  createProduct(@Body() productDto: CreateProductDto): Promise<Product> {
    return this.productService.createProduct(productDto);
  }
  @Get(PRODUCT_REQUEST_MAPPING.GET_ALL_PRODUCT)
  getAllProduct(): Promise<Product[]> {
    return this.productService.findAll();
  }
  @Get(PRODUCT_REQUEST_MAPPING.GET_PRODUCT_BY_ID)
  getProductById(id: string): Promise<Product | null> {
    return this.productService.findById(id);
  }
  @Delete(PRODUCT_REQUEST_MAPPING.REMOVE_PRODUCT)
  removeProduct(id: string): Promise<void> {
    return this.productService.remove(id);
  }
}
