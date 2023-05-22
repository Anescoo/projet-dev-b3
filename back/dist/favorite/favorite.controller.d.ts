import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
import { CreateFavoriteDto } from './dto/createFavoriteDto';
export declare class FavoriteController {
    private favoriteService;
    constructor(favoriteService: FavoriteService);
    createFavorite(favoriteDto: CreateFavoriteDto): Promise<Favorite>;
    getAllFavorite(): Promise<Favorite[]>;
    getFavoriteById(id: string): Promise<Favorite | null>;
    removeFavorite(id: string): Promise<void>;
}
