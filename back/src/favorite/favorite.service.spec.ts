import { Test, TestingModule } from '@nestjs/testing';
import { Repository } from 'typeorm';
import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
import { Product } from 'src/products/entity/product.entity';
import { User } from 'src/users/entity/user.entity';

describe('FavoriteService', () => {
  let favoriteService: FavoriteService;
  let favoritesRepository: Repository<Favorite>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FavoriteService,
        {
          provide: Repository,
          useClass: jest.fn(),
        },
      ],
    }).compile();

    favoriteService = module.get<FavoriteService>(FavoriteService);
    favoritesRepository = module.get<Repository<Favorite>>(Repository);
  });

  describe('createFavorite', () => {
    it('should create and return a new favorite', async () => {
      const favorite: Favorite = {
	      id: '',
	      user: new User,
	      product: new Product,
	      created_at: undefined
      };

      const saveSpy = jest
        .spyOn(favoritesRepository, 'save')
        .mockResolvedValue(favorite);

      const result = await favoriteService.createFavorite(favorite);

      expect(saveSpy).toHaveBeenCalledWith(favorite);
      expect(result).toEqual(favorite);
    });
  });

  describe('findAll', () => {
    it('should return an array of favorites', async () => {
      const favorites: Favorite[] = [
        // Mock your favorites array here
      ];

      const findSpy = jest
        .spyOn(favoritesRepository, 'find')
        .mockResolvedValue(favorites);

      const result = await favoriteService.findAll();

      expect(findSpy).toHaveBeenCalled();
      expect(result).toEqual(favorites);
    });
  });

  describe('findById', () => {
    it('should return a favorite by its ID', async () => {
      const favoriteId = '1';
      const favorite: Favorite = {
	      id: '',
	      user: new User,
	      product: new Product,
	      created_at: undefined
      };

      const findOneSpy = jest
        .spyOn(favoritesRepository, 'findOne')
        .mockResolvedValue(favorite);

      const result = await favoriteService.findById(favoriteId);

      expect(findOneSpy).toHaveBeenCalledWith({ id: favoriteId });
      expect(result).toEqual(favorite);
    });

    it('should return null if no favorite is found', async () => {
      const favoriteId = '1';

      const findOneSpy = jest
        .spyOn(favoritesRepository, 'findOne')
        .mockResolvedValue(null);

      const result = await favoriteService.findById(favoriteId);

      expect(findOneSpy).toHaveBeenCalledWith({ id: favoriteId });
      expect(result).toBeNull();
    });
  });

  describe('remove', () => {
    it('should remove a favorite by its ID', async () => {
      const favoriteId = '1';

      const deleteSpy = jest
        .spyOn(favoritesRepository, 'delete')
        .mockResolvedValue(undefined);

      await favoriteService.remove(favoriteId);

      expect(deleteSpy).toHaveBeenCalledWith(favoriteId);
    });
  });
});
