import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProductReview } from './productReview.entity';

@Injectable()
export class ProductReviewService {
  constructor(
    @InjectRepository(ProductReview)
    private reviewRepository: Repository<ProductReview>,
  ) {}

  getProductReview(
    productId: string,
    userId: string,
  ): Promise<ProductReview | null> {
    return null;
  }
  getAllProductReview(): Promise<ProductReview | null> {
    // this.productsReviewRepository.createQueryBuilder
    return null;
  }
}
