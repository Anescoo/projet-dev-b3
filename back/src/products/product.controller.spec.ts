import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProductService } from './product.service';
import { Product } from './entity/product.entity';

import request from 'supertest';
import { ProductController } from './product.controller';

describe('ProductService', () => {
  let service: ProductService;
  let repository: Repository<Product>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ProductService,
        {
          provide: getRepositoryToken(Product),
          useClass: Repository,
        },
      ],
    }).compile();

    service = module.get<ProductService>(ProductService);
    repository = module.get<Repository<Product>>(getRepositoryToken(Product));
  });

  describe('getPing', () => {
    it('should return "pong"', () => {
      const result = service.getPing();
      expect(result).toEqual('pong');
    });
  });

  describe('createProduct', () => {
    it('should create a product', async () => {
      const product = new Product();
      product.productName = 'Test product';
      product.productQuantity = 50;
      product.price = 10;
      // crée un espion (ou mock) pour la méthode save() de l'objet repository.
      // Lorsque la méthode save() est appelée, elle ne sauvegarde pas réellement l'objet dans la base de données.
      // Au lieu de cela, elle renvoie une promesse résolue avec la valeur product fournie.
      jest.spyOn(repository, 'save').mockResolvedValue(product);

      const result = await service.createProduct(product);
      expect(result).toEqual(product);
    });
  });

  describe('findAll', () => {
    it('should return an array of products', async () => {
      const products = [new Product(), new Product()];
      jest.spyOn(repository, 'find').mockResolvedValue(products);

      const result = await service.findAll();
      expect(result).toEqual(products);
    });
  });

  describe('findById', () => {
    it('should return a product with the given ID', async () => {
      const product = new Product();
      product.productId = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(repository, 'findOneBy').mockResolvedValue(product);

      const result = await service.findById(
        '550e8400-e29b-41d4-a716-446655440000',
      );
      expect(result).toEqual(product);
    });
  });

  describe('remove', () => {
    it('should remove a product with the given ID', async () => {
      const id = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(repository, 'delete').mockResolvedValue(undefined);

      await service.remove(id);
      expect(repository.delete).toHaveBeenCalledWith(id);
    });
  });
});

// describe('ProductController', () => {
//   let controller;
//   let productService;

//   beforeEach(async () => {
//     const moduleRef = await Test.createTestingModule({
//       controllers: [ProductController],
//       providers: [
//         {
//           provide: ProductService,
//           useValue: {
//             getAllProducts: jest.fn(),
//             createProduct: jest.fn(),
//           },
//         },
//       ],
//     }).compile();

//     controller = moduleRef.get(ProductController);
//     productService = moduleRef.get(ProductService);
//   });

//   describe('getAllProducts', () => {
//     it('should return an array of products', async () => {
//       const products = [{ id: 1, name: 'product1' }, { id: 2, name: 'product2' }];
//       productService.getAllProducts.mockResolvedValue(products);

//       const response = await request(controller.app.getHttpServer())
//         .get('/products')
//         .expect(200);

//       expect(response.body).toEqual(products);
//     });
//   });

//   describe('createProduct', () => {
//     it('should create a new product', async () => {
//       const product = { name: 'new product' };
//       productService.createProduct.mockResolvedValue(product);

//       const response = await request(controller.app.getHttpServer())
//         .post('/products')
//         .send(product)
//         .expect(201);

//       expect(response.body).toEqual(product);
//     });
//   });
// });
