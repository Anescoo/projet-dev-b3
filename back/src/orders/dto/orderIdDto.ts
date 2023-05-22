import { MaxLength } from 'class-validator';

export class orderIdDto {
  @MaxLength(36)
  orderId: string;
}
