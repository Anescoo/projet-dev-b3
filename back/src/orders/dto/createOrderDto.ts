import {
  IsDateString,
  IsNotEmpty,
} from 'class-validator';
import { User } from '../../users/entity/user.entity';

export class CreateOrderDto {
  @IsNotEmpty()
  user: User;

  @IsNotEmpty()
  status: string;

  @IsNotEmpty()
  @IsDateString()
  created_at: Date;

  @IsNotEmpty()
  @IsDateString()
  updated_at: Date;
}
