import { IsBoolean, IsEmail, IsNotEmpty, MinLength } from 'class-validator';

export class SigUpnDto {
  @IsNotEmpty()
  @IsNotEmpty()
  userName: string;

  @IsNotEmpty()
  @IsEmail()
  email: string;

  @IsNotEmpty()
  @MinLength(8)
  password: string;

  @IsNotEmpty()
  @IsBoolean()
  isAdmin: boolean;
}
