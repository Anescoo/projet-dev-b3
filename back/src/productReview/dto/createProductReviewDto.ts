import {
  IsDateString,
  IsNotEmpty,
} from 'class-validator';
import { User } from '../../users/entity/user.entity';
import { Product } from 'src/products/entity/product.entity';

export class CreateProductReviewDto {
  @IsNotEmpty()
  user: User;

  @IsNotEmpty()
  product: Product;

  @IsNotEmpty()
  rating: number;

  @IsNotEmpty()
  comment: string;

  @IsNotEmpty()
  @IsDateString()
  created_at: Date;

  @IsNotEmpty()
  @IsDateString()
  updated_at: Date;
}
