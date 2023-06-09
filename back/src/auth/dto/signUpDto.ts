import {
  IsBoolean,
  IsEmail,
  IsNotEmpty,
  IsString,
  Length,
} from 'class-validator';

export class SignUpDto {
  @IsString()
  @IsNotEmpty()
  @Length(1, 20)
  userName: string;

  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  @Length(8, 20)
  password: string;

  @IsBoolean()
  isAdmin?: boolean;
}
