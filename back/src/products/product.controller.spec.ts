import { Test, TestingModule } from '@nestjs/testing';
import { ProductController } from './product.controller';
import { Repository } from 'typeorm';
import { getRepositoryToken } from '@nestjs/typeorm';
import { ProductService } from './product.service';
import { Product } from './entity/product.entity';

describe('ProductController', () => {
  let productController: ProductController;
  let productService: ProductService;
  const mockRepository = {
    // implémentez les méthodes de repository nécessaires pour votre test
    ping: jest.fn(() => {
      console.log('test');
      Promise.resolve('pong');
    }),
  };
  const mockProduct: Product = {
    productId: '550e8400-e29b-41d4-a716-446655440000',
    productName: 'produit1',
    price: 50,
    productQuantity: 1,
  };
  const mockProductRepository = {
    save: jest
      .fn()
      .mockImplementation((product: Product) => Promise.resolve(product)),
  };
  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [ProductController],
      providers: [
        ProductService,
        {
          provide: getRepositoryToken(Product),
          useValue: mockProductRepository,
        },
      ],
      imports: [Repository],
    }).compile();

    productController = app.get<ProductController>(ProductController);
    productService = app.get<ProductService>(ProductService);
  });

  describe.skip('test if service and controller working', () => {
    it('controller working well', async () => {
      const result = await productService.getPing();
      expect(result).toBe('pong');
    });

    it('sercice working well', async () => {
      const result = productController.getPing();
      expect(result).toBe('pong');
      // expect(mockRepository.ping).toHaveBeenCalled();
    });
  });
  describe('should have service CRUD working', () => {
    it('should save Product', async () => {
      const result = await productService.createProduct(mockProduct);
      expect(mockProductRepository.save).toHaveBeenCalledWith(mockProduct);
      expect(result).toMatchObject(mockProduct);
    });
    it('should find all Product', async () => {
      const result = await productService.findAll();
      expect(mockProductRepository.save).toHaveBeenCalledWith(mockProduct);
      expect(result).toMatchObject(mockProduct);
    });
  });
});
