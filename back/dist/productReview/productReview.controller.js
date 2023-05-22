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
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProductReviewController = void 0;
const common_1 = require("@nestjs/common");
const productReview_service_1 = require("./productReview.service");
const productReview_entity_1 = require("./entity/productReview.entity");
const constants_1 = require("./../constants");
let ProductReviewController = class ProductReviewController {
    constructor(ProductReviewService) {
        this.ProductReviewService = ProductReviewService;
    }
    createProductReview(ProductReview) {
        return this.ProductReviewService.createProductReview(ProductReview);
    }
    getAllProductReview() {
        return this.ProductReviewService.findAll();
    }
    getProductReviewById(id) {
        return this.ProductReviewService.findById(id);
    }
    removeProductReview(id) {
        return this.ProductReviewService.remove(id);
    }
};
__decorate([
    (0, common_1.Post)(constants_1.PRODUCT_REVIEW_REQUEST_MAPPING.CREATE_PRODUCT_REVIEW),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [productReview_entity_1.ProductReview]),
    __metadata("design:returntype", Promise)
], ProductReviewController.prototype, "createProductReview", null);
__decorate([
    (0, common_1.Get)(constants_1.PRODUCT_REVIEW_REQUEST_MAPPING.GET_ALL_PRODUCT_REVIEW),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], ProductReviewController.prototype, "getAllProductReview", null);
__decorate([
    (0, common_1.Get)(constants_1.PRODUCT_REVIEW_REQUEST_MAPPING.GET_PRODUCT_REVIEW_BY_ID),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], ProductReviewController.prototype, "getProductReviewById", null);
__decorate([
    (0, common_1.Delete)(constants_1.PRODUCT_REVIEW_REQUEST_MAPPING.REMOVE_PRODUCT_REVIEW),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], ProductReviewController.prototype, "removeProductReview", null);
ProductReviewController = __decorate([
    (0, common_1.Controller)(constants_1.ROUTEPATH),
    __metadata("design:paramtypes", [productReview_service_1.ProductReviewService])
], ProductReviewController);
exports.ProductReviewController = ProductReviewController;
//# sourceMappingURL=productReview.controller.js.map