import { ProductService } from './product.service';
import { Product } from './entity/product.entity';
import { CreateProductDto } from './dto/createProductDto';
export declare class ProductController {
    private productService;
    constructor(productService: ProductService);
    getPing(): string;
    createProduct(productDto: CreateProductDto): Promise<Product>;
    getAllProduct(): Promise<Product[]>;
    getProductById(id: string): Promise<Product | null>;
    removeProduct(id: string): Promise<void>;
}
