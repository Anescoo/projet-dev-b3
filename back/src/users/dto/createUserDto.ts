import {
  IsNotEmpty,
  IsString, 
  MaxLength,
} from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty()
//   @IsString()
//   @MaxLength(255)
  userName: string;

  @IsNotEmpty()
//   @IsString()
//   @MaxLength(255)
  email: string;

  @IsNotEmpty()
//   @IsString()
//   @MaxLength(255)
  password: string;

  @IsNotEmpty()
  isAdmin: Boolean;
}
