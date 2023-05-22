import { User } from '../../users/entity/user.entity';
import { Product } from 'src/products/entity/product.entity';
export declare class CreateProductReviewDto {
    user: User;
    product: Product;
    rating: number;
    comment: string;
    created_at: Date;
    updated_at: Date;
}
