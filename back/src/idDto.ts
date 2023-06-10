import { IsUUID } from 'class-validator';

export class idDto {
  @IsUUID()
  id: string;
}
