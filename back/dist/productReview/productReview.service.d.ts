import { Repository } from 'typeorm';
import { ProductReview } from './productReview.entity';
export declare class ProductReviewService {
    private reviewRepository;
    constructor(reviewRepository: Repository<ProductReview>);
    getProductReview(productId: string, userId: string): Promise<ProductReview | null>;
    getAllProductReview(): Promise<ProductReview | null>;
}
