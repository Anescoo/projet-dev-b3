import { Module } from '@nestjs/common';
import { ProductReviewController } from './productReview.controller';
import { ProductReviewService } from './productReview.service';
import { ProductReview } from './entity/productReview.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
@Module({
  controllers: [ProductReviewController],
  providers: [ProductReviewService],
  imports: [TypeOrmModule.forFeature([ProductReview])],
})
export class ProductReviewModule {}
