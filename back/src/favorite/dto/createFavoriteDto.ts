import {
  IsDateString,
  IsNotEmpty,
} from 'class-validator';
import { User } from '../../users/entity/user.entity';
import { Product } from 'src/products/entity/product.entity';

export class CreateFavoriteDto {
  @IsNotEmpty()
  user: User;

  @IsNotEmpty()
  product: Product;

  @IsNotEmpty()
  @IsDateString()
  created_at: Date;
}
