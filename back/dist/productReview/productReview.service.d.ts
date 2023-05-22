import { Repository } from 'typeorm';
import { ProductReview } from './entity/productReview.entity';
export declare class ProductReviewService {
    private ProductReviewRepository;
    constructor(ProductReviewRepository: Repository<ProductReview>);
    createProductReview(ProductReview: ProductReview): Promise<ProductReview>;
    findAll(): Promise<ProductReview[]>;
    findById(id: string): Promise<ProductReview | null>;
    remove(id: string): Promise<void>;
}
