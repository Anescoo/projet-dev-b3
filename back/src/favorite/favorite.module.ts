import { Module } from '@nestjs/common';
import { FavoriteController } from './favorite.controller';
import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
@Module({
  controllers: [FavoriteController],
  providers: [FavoriteService],
  imports: [TypeOrmModule.forFeature([Favorite])],
})
export class FavoriteModule {}
