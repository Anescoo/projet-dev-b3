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
exports.ProductReview = void 0;
const user_entity_1 = require("../users/entity/user.entity");
const typeorm_1 = require("typeorm");
const product_entity_1 = require("../products/entity/product.entity");
let ProductReview = class ProductReview {
};
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], ProductReview.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => user_entity_1.User, { onDelete: 'CASCADE' }),
    __metadata("design:type", user_entity_1.User)
], ProductReview.prototype, "user", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => product_entity_1.Product),
    __metadata("design:type", product_entity_1.Product)
], ProductReview.prototype, "product", void 0);
__decorate([
    (0, typeorm_1.Column)(),
    __metadata("design:type", Number)
], ProductReview.prototype, "rating", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], ProductReview.prototype, "comment", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], ProductReview.prototype, "created_at", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], ProductReview.prototype, "updated_at", void 0);
ProductReview = __decorate([
    (0, typeorm_1.Entity)()
], ProductReview);
exports.ProductReview = ProductReview;
//# sourceMappingURL=productReview.entity.js.map