import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, FindManyOptions } from 'typeorm';
import { Product } from './entity/product.entity';
import { CreateProductDto } from './dto/createProductDto';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private productsRepository: Repository<Product>,
  ) {}

  getPing(): string {
    return 'pong';
  }

  createProduct(productDto: CreateProductDto): Promise<Product> {
    return this.productsRepository.save(productDto);
  }

  findAll(): Promise<Product[]> {
    return this.productsRepository.find();
  }

 async findSomeProducts(): Promise<Product[]> {
  const options: FindManyOptions<Product> = {
    take: 5, // Limiter à 5 résultats
  };
  const products = await this.productsRepository.find(options);

  if (products.length < 5) {
    throw new Error("Il y a moins de 5 produits disponibles.");
  }

  return products;
}

//  async findMostLikedProducts(): Promise<Product[]> {
//    const options: FindManyOptions<Product> = {
//      take: 5, // Limiter à 5 résultats
//      order: {
//        favorites: 'DESC', // Tri par ordre décroissant des likes
//      },
//    };
//    const products = await this.productsRepository.find(options);

//    return products;
// }

  findById(id: string): Promise<Product | null> {
    return this.productsRepository.findOneBy({
      productId: id, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.productsRepository.delete(id);
  }
}
