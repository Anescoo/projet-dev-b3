import { User } from '../../users/entity/user.entity';
import { Product } from 'src/products/entity/product.entity';
export declare class Favorite {
    id: string;
    user: User;
    product: Product;
    created_at: Date;
}
