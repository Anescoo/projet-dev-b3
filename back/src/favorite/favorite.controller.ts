import { Body,Controller, Get, Post, Delete } from '@nestjs/common';
import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
import { FAVORITE_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { CreateFavoriteDto } from './dto/createFavoriteDto';

@Controller(ROUTEPATH)
export class FavoriteController {
  constructor(private favoriteService: FavoriteService) {}

  @Post(FAVORITE_REQUEST_MAPPING.CREATE_FAVORITE)
  createFavorite(@Body() favoriteDto: CreateFavoriteDto ): Promise<Favorite> {
    return this.favoriteService.createFavorite(favoriteDto);
  }
  @Get(FAVORITE_REQUEST_MAPPING.GET_ALL_FAVORITE)
  getAllFavorite(): Promise<Favorite[]> {
    return this.favoriteService.findAll();
  }
  @Get(FAVORITE_REQUEST_MAPPING.GET_FAVORITE_BY_ID)
  getFavoriteById(id: string): Promise<Favorite | null> {
    return this.favoriteService.findById(id);
  }
  @Delete(FAVORITE_REQUEST_MAPPING.REMOVE_FAVORITE)
  removeFavorite(id: string): Promise<void> {
    return this.favoriteService.remove(id);
  }
}
