import { MaxLength } from 'class-validator';

export class productIdDto {
  @MaxLength(36)
  productId: string;
}
