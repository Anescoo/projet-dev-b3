import { Test, TestingModule } from '@nestjs/testing';
import { ProductService } from './product.service';
import { Product } from './entity/product.entity';

import { ProductController } from './product.controller';

describe('ProductController', () => {
  let controller: ProductController;
  let service: ProductService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProductController],
      providers: [
        {
          provide: ProductService,
          useValue: {
            getPing: jest.fn(),
            createProduct: jest.fn(),
            findAll: jest.fn(),
            findById: jest.fn(),
            remove: jest.fn(),
          },
        },
      ],
    }).compile();

    controller = module.get<ProductController>(ProductController);
    service = module.get<ProductService>(ProductService);
  });

  describe('getPing', () => {
    it('should return "pong"', () => {
      const result = 'pong';
      jest.spyOn(service, 'getPing').mockReturnValue(result);

      expect(controller.getPing()).toBe(result);
      expect(service.getPing).toHaveBeenCalled();
    });
  });

  describe('createProduct', () => {
    it('should create a product', async () => {
      const product = new Product();
      const result = new Product();
      jest.spyOn(service, 'createProduct').mockResolvedValue(result);

      expect(await controller.createProduct(product)).toBe(result);
      expect(service.createProduct).toHaveBeenCalledWith(product);
    });
  });

  describe('getAllProduct', () => {
    it('should return an array of products', async () => {
      const products = [new Product(), new Product()];
      jest.spyOn(service, 'findAll').mockResolvedValue(products);

      expect(await controller.getAllProduct()).toBe(products);
      expect(service.findAll).toHaveBeenCalled();
    });
  });

  describe('getProductById', () => {
    it('should return a product with the given ID', async () => {
      const product = new Product();
      const id = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(service, 'findById').mockResolvedValue(product);

      expect(await controller.getProductById(id)).toBe(product);
      expect(service.findById).toHaveBeenCalledWith(id);
    });

    it('should return null if no product is found', async () => {
      const id = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(service, 'findById').mockResolvedValue(null);

      expect(await controller.getProductById(id)).toBeNull();
      expect(service.findById).toHaveBeenCalledWith(id);
    });
  });

  describe('removeProduct', () => {
    it('should remove a product with the given ID', async () => {
      const id = '550e8400-e29b-41d4-a716-446655440000';

      expect(await controller.removeProduct(id)).toBeUndefined();
      expect(service.remove).toHaveBeenCalledWith(id);
    });
  });
});
