import { MaxLength } from 'class-validator';

export class userIdDto {
  @MaxLength(36)
  userId: string;
}
