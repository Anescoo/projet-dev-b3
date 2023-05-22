import { ProductReviewService } from './productReview.service';
import { ProductReview } from './entity/productReview.entity';
import { CreateProductReviewDto } from './dto/createProductReviewDto';
export declare class ProductReviewController {
    private ProductReviewService;
    constructor(ProductReviewService: ProductReviewService);
    createProductReview(ProductReviewDto: CreateProductReviewDto): Promise<ProductReview>;
    getAllProductReview(): Promise<ProductReview[]>;
    getProductReviewById(id: string): Promise<ProductReview | null>;
    removeProductReview(id: string): Promise<void>;
}
