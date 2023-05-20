import { Repository } from 'typeorm';
import { Product } from './entity/product.entity';
import { CreateProductDto } from './dto/createProductDto';
export declare class ProductService {
    private productsRepository;
    constructor(productsRepository: Repository<Product>);
    getPing(): string;
    createProduct(productDto: CreateProductDto): Promise<Product>;
    findAll(): Promise<Product[]>;
    findById(id: string): Promise<Product | null>;
    remove(id: string): Promise<void>;
}
