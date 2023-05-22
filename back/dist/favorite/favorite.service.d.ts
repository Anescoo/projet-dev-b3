import { Repository } from 'typeorm';
import { Favorite } from './entity/favorite.entity';
export declare class FavoriteService {
    private favoritesRepository;
    constructor(favoritesRepository: Repository<Favorite>);
    createFavorite(favorite: Favorite): Promise<Favorite>;
    findAll(): Promise<Favorite[]>;
    findById(id: string): Promise<Favorite | null>;
    remove(id: string): Promise<void>;
}
