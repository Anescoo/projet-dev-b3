import { ProductReviewService } from './productReview.service';
import { ProductReview } from './entity/productReview.entity';
export declare class ProductReviewController {
    private ProductReviewService;
    constructor(ProductReviewService: ProductReviewService);
    createProductReview(ProductReview: ProductReview): Promise<ProductReview>;
    getAllProductReview(): Promise<ProductReview[]>;
    getProductReviewById(id: string): Promise<ProductReview | null>;
    removeProductReview(id: string): Promise<void>;
}
