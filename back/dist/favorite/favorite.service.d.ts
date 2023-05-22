import { Repository } from 'typeorm';
import { Favorite } from './entity/favorite.entity';
import { CreateFavoriteDto } from './dto/createFavoriteDto';
export declare class FavoriteService {
    private favoritesRepository;
    constructor(favoritesRepository: Repository<Favorite>);
    createFavorite(favoriteDto: CreateFavoriteDto): Promise<Favorite>;
    findAll(): Promise<Favorite[]>;
    findById(id: string): Promise<Favorite | null>;
    remove(id: string): Promise<void>;
}
