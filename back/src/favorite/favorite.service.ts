import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Favorite } from './entity/favorite.entity';

@Injectable()
export class FavoriteService {
  constructor(
    @InjectRepository(Favorite)
    private favoritesRepository: Repository<Favorite>,
  ) {}

  createFavorite(favorite: Favorite): Promise<Favorite> {
    return this.favoritesRepository.save(favorite);
  }

  findAll(): Promise<Favorite[]> {
    return this.favoritesRepository.find();
  }

  findById(id: string): Promise<Favorite | null> {
    return this.favoritesRepository.findOneBy({
      id: id, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.favoritesRepository.delete(id);
  }
}
