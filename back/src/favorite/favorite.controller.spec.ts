import { Test, TestingModule } from '@nestjs/testing';
import { FavoriteController } from './favorite.controller';
import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';
import { Product } from 'src/products/entity/product.entity';
import { User } from 'src/users/entity/user.entity';

describe('FavoriteController', () => {
  let controller: FavoriteController;
  let service: FavoriteService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [FavoriteController],
      providers: [FavoriteService],
    }).compile();

    controller = module.get<FavoriteController>(FavoriteController);
    service = module.get<FavoriteService>(FavoriteService);
  });

  describe('createFavorite', () => {
    it('should create a favorite', async () => {
      const favorite: Favorite = {
	      favoriteId: '',
	      user: new User,
	      product: new Product,
	      created_at: undefined
      };

      jest.spyOn(service, 'createFavorite').mockResolvedValue(favorite);

      const result = await controller.createFavorite(favorite);

      expect(result).toEqual(favorite);
      expect(service.createFavorite).toHaveBeenCalledWith(favorite);
    });
  });

  describe('getAllFavorite', () => {
    it('should return an array of favorites', async () => {
      const favorites: Favorite[] = [
        // Mock an array of favorites here
      ];

      jest.spyOn(service, 'findAll').mockResolvedValue(favorites);

      const result = await controller.getAllFavorite();

      expect(result).toEqual(favorites);
      expect(service.findAll).toHaveBeenCalled();
    });
  });

  describe('getFavoriteById', () => {
    it('should return a favorite by ID', async () => {
      const favorite: Favorite = {
	      favoriteId: '',
	      user: new User,
	      product: new Product,
	      created_at: undefined
      };
      const id = 'mocked-id';

      jest.spyOn(service, 'findById').mockResolvedValue(favorite);

      const result = await controller.getFavoriteById(id);

      expect(result).toEqual(favorite);
      expect(service.findById).toHaveBeenCalledWith(id);
    });
  });

  describe('removeFavorite', () => {
    it('should remove a favorite', async () => {
      const id = 'mocked-id';

      jest.spyOn(service, 'remove').mockResolvedValue();

      const result = await controller.removeFavorite(id);

      expect(result).toBeUndefined();
      expect(service.remove).toHaveBeenCalledWith(id);
    });
  });
});
