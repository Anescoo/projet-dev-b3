import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { FavoriteService } from './favorite.service';
import { Favorite } from './entity/favorite.entity';

describe('FavoriteService', () => {
  let favoriteService: FavoriteService;
  let favoritesRepository: Repository<Favorite>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FavoriteService,
        {
          provide: getRepositoryToken(Favorite),
          useClass: Repository,
        },
      ],
    }).compile();

    favoriteService = module.get<FavoriteService>(FavoriteService);
    favoritesRepository = module.get<Repository<Favorite>>(
      getRepositoryToken(Favorite),
    );
  });

  describe('createFavorite', () => {
    it('should create a favorite', async () => {
      const favorite = new Favorite();
      favorite.id = 1;
      favorite.name = 'Product A';

      const spy = jest
        .spyOn(favoritesRepository, 'save')
        .mockResolvedValueOnce(favorite);

      const createdFavorite = await favoriteService.createFavorite(favorite);

      expect(createdFavorite).toEqual(favorite);
      expect(spy).toHaveBeenCalledWith(favorite);
    });
  });

  describe('findAll', () => {
    it('should return an array of favorites', async () => {
      const favorites = [
        { id: 1, name: 'Product A' },
        { id: 2, name: 'Product B' },
        { id: 3, name: 'Product C' },
      ];

      const spy = jest
        .spyOn(favoritesRepository, 'find')
        .mockResolvedValueOnce(favorites);

      const foundFavorites = await favoriteService.findAll();

      expect(foundFavorites).toEqual(favorites);
      expect(spy).toHaveBeenCalled();
    });
  });

  describe('findById', () => {
    it('should return a favorite with the specified id', async () => {
      const favorite = { id: 1, name: 'Product A' };

      const spy = jest
        .spyOn(favoritesRepository, 'findOne')
        .mockResolvedValueOnce(favorite);

      const foundFavorite = await favoriteService.findById('1');

      expect(foundFavorite).toEqual(favorite);
      expect(spy).toHaveBeenCalledWith({ id: '1' });
    });

    it('should return null if no favorite with the specified id is found', async () => {
      const spy = jest
        .spyOn(favoritesRepository, 'findOne')
        .mockResolvedValueOnce(null);

      const foundFavorite = await favoriteService.findById('1');

      expect(foundFavorite).toBeNull();
      expect(spy).toHaveBeenCalledWith({ id: '1' });
    });
  });

  describe('remove', () => {
    it('should remove a favorite with the specified id', async () => {
      const spy = jest
        .spyOn(favoritesRepository, 'delete')
        .mockResolvedValueOnce(undefined);

      await favoriteService.remove('1');

      expect(spy).toHaveBeenCalledWith('1');
    });
  });
});
