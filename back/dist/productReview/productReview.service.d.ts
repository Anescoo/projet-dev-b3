import { Repository } from 'typeorm';
import { ProductReview } from './entity/productReview.entity';
import { CreateProductReviewDto } from './dto/createProductReviewDto';
export declare class ProductReviewService {
    private ProductReviewRepository;
    constructor(ProductReviewRepository: Repository<ProductReview>);
    createProductReview(ProductReviewDto: CreateProductReviewDto): Promise<ProductReview>;
    findAll(): Promise<ProductReview[]>;
    findById(id: string): Promise<ProductReview | null>;
    remove(id: string): Promise<void>;
}
