import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
export declare class FavoriteController {
    private favoriteService;
    constructor(favoriteService: FavoriteService);
    createFavorite(favorite: Favorite): Promise<Favorite>;
    getAllFavorite(): Promise<Favorite[]>;
    getFavoriteById(id: string): Promise<Favorite | null>;
    removeFavorite(id: string): Promise<void>;
}
