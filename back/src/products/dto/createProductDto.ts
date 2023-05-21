import {
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  MaxLength,
} from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  @IsString()
  @MaxLength(255)
  productName: string;

  @IsOptional()
  @IsString()
  @MaxLength(255)
  description?: string;

  @IsNotEmpty()
  @IsNumber()
  price: number;

  @IsOptional()
  imageUrl: string | null;

  @IsNotEmpty()
  @IsNumber()
  productQuantity: number;
}
