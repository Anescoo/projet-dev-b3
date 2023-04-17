import { Test, TestingModule } from '@nestjs/testing';
import { StoreController } from './store.controller';
import { StoreService } from './store.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Store } from './entity/store.entity';

describe('StoreController', () => {
  let storeController: StoreController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      imports: [TypeOrmModule.forFeature([Store])],
      controllers: [StoreController],
      providers: [StoreService],
    }).compile();

    storeController = app.get<StoreController>(StoreController);
  });

  //! test not passed : Nest can't resolve dependencies of the StoreRepository (?). Please make sure that the argument DataSource at index [0] is available in the TypeOrmModule context.
  describe('store', () => {
    it('should return "Hello from store"', () => {
      expect(storeController.getHello()).toBe('Hello from store');
    });
  });
});
