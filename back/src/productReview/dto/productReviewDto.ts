import { MaxLength } from 'class-validator';

export class productReviewIdDto {
  @MaxLength(36)
  id: string;
}
