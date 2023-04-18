import { Module } from '@nestjs/common';
import { ProductController } from './product.controller';
import { getRepositoryToken } from '@nestjs/typeorm';
import { ProducService } from './product.service';
import { Product } from './entity/product.entity';
@Module({
  controllers: [ProductController],
})
export class ProductsModule {}
