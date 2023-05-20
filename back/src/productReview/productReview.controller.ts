import { Controller, Get, Post, Delete } from '@nestjs/common';
import { ProductReviewService } from './productReview.service';
import { ProductReview } from './entity/productReview.entity';
import { PRODUCT_REVIEW_REQUEST_MAPPING, ROUTEPATH } from './../constants';

@Controller(ROUTEPATH)
export class ProductReviewController {
  constructor(private ProductReviewService: ProductReviewService) {}

  @Post(PRODUCT_REVIEW_REQUEST_MAPPING.CREATE_PRODUCT_REVIEW)
  createProductReview(ProductReview: ProductReview): Promise<ProductReview> {
    return this.ProductReviewService.createProductReview(ProductReview);
  }
  @Get(PRODUCT_REVIEW_REQUEST_MAPPING.GET_ALL_PRODUCT_REVIEW)
  getAllProductReview(): Promise<ProductReview[]> {
    return this.ProductReviewService.findAll();
  }
  @Get(PRODUCT_REVIEW_REQUEST_MAPPING.GET_PRODUCT_REVIEW_BY_ID)
  getProductReviewById(id: string): Promise<ProductReview| null> {
    return this.ProductReviewService.findById(id);
  }
  @Delete(PRODUCT_REVIEW_REQUEST_MAPPING.REMOVE_PRODUCT_REVIEW)
  removeProductReview(id: string): Promise<void> {
    return this.ProductReviewService.remove(id);
  }
}
