import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProductReview } from './entity/productReview.entity';

@Injectable()
export class ProductReviewService {
  constructor(
    @InjectRepository(ProductReview)
    private ProductReviewRepository: Repository<ProductReview>,
  ) {}

  createProductReview(ProductReview: ProductReview): Promise<ProductReview> {
    return this.ProductReviewRepository.save(ProductReview);
  }

  findAll(): Promise<ProductReview[]> {
    return this.ProductReviewRepository.find();
  }

  findById(id: string): Promise<ProductReview | null> {
    return this.ProductReviewRepository.findOneBy({
      id: id, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.ProductReviewRepository.delete(id);
  }
}
