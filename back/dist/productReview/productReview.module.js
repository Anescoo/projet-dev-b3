"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProductReviewModule = void 0;
const common_1 = require("@nestjs/common");
const productReview_controller_1 = require("./productReview.controller");
const productReview_service_1 = require("./productReview.service");
const productReview_entity_1 = require("./entity/productReview.entity");
const typeorm_1 = require("@nestjs/typeorm");
let ProductReviewModule = class ProductReviewModule {
};
ProductReviewModule = __decorate([
    (0, common_1.Module)({
        controllers: [productReview_controller_1.ProductReviewController],
        providers: [productReview_service_1.ProductReviewService],
        imports: [typeorm_1.TypeOrmModule.forFeature([productReview_entity_1.ProductReview])],
    })
], ProductReviewModule);
exports.ProductReviewModule = ProductReviewModule;
//# sourceMappingURL=productReview.module.js.map