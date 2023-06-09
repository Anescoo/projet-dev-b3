"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProductController = void 0;
const common_1 = require("@nestjs/common");
const product_service_1 = require("./product.service");
const constants_1 = require("./../constants");
const createProductDto_1 = require("./dto/createProductDto");
let ProductController = class ProductController {
    constructor(productService) {
        this.productService = productService;
    }
    getPing() {
        return this.productService.getPing();
    }
    createProduct(productDto) {
        return this.productService.createProduct(productDto);
    }
    getAllProduct() {
        return this.productService.findAll();
    }
    getProductById(id) {
        return this.productService.findById(id);
    }
    removeProduct(id) {
        return this.productService.remove(id);
    }
};
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", String)
], ProductController.prototype, "getPing", null);
__decorate([
    (0, common_1.Post)(constants_1.PRODUCT_REQUEST_MAPPING.CREATE_PRODUCT),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [createProductDto_1.CreateProductDto]),
    __metadata("design:returntype", Promise)
], ProductController.prototype, "createProduct", null);
__decorate([
    (0, common_1.Get)(constants_1.PRODUCT_REQUEST_MAPPING.GET_ALL_PRODUCT),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], ProductController.prototype, "getAllProduct", null);
__decorate([
    (0, common_1.Get)(constants_1.PRODUCT_REQUEST_MAPPING.GET_PRODUCT_BY_ID),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], ProductController.prototype, "getProductById", null);
__decorate([
    (0, common_1.Delete)(constants_1.PRODUCT_REQUEST_MAPPING.REMOVE_PRODUCT),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], ProductController.prototype, "removeProduct", null);
ProductController = __decorate([
    (0, common_1.Controller)(constants_1.ROUTEPATH),
    __metadata("design:paramtypes", [product_service_1.ProductService])
], ProductController);
exports.ProductController = ProductController;
//# sourceMappingURL=product.controller.js.map