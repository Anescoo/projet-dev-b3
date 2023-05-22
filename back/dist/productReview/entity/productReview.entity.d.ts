import { User } from '../../users/entity/user.entity';
import { Product } from '../../products/entity/product.entity';
export declare class ProductReview {
    id: string;
    user: User;
    product: Product;
    rating: number;
    comment: string;
    created_at: Date;
    updated_at: Date;
}
