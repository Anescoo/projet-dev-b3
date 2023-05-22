import { MaxLength } from 'class-validator';

export class favoriteIdDto {
  @MaxLength(36)
  favoriteId: string;
}
