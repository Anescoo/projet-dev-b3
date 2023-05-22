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
exports.FavoriteController = void 0;
const common_1 = require("@nestjs/common");
const favorite_service_1 = require("./favorite.service");
const constants_1 = require("./../constants");
const createFavoriteDto_1 = require("./dto/createFavoriteDto");
let FavoriteController = class FavoriteController {
    constructor(favoriteService) {
        this.favoriteService = favoriteService;
    }
    createFavorite(favoriteDto) {
        return this.favoriteService.createFavorite(favoriteDto);
    }
    getAllFavorite() {
        return this.favoriteService.findAll();
    }
    getFavoriteById(id) {
        return this.favoriteService.findById(id);
    }
    removeFavorite(id) {
        return this.favoriteService.remove(id);
    }
};
__decorate([
    (0, common_1.Post)(constants_1.FAVORITE_REQUEST_MAPPING.CREATE_FAVORITE),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [createFavoriteDto_1.CreateFavoriteDto]),
    __metadata("design:returntype", Promise)
], FavoriteController.prototype, "createFavorite", null);
__decorate([
    (0, common_1.Get)(constants_1.FAVORITE_REQUEST_MAPPING.GET_ALL_FAVORITE),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], FavoriteController.prototype, "getAllFavorite", null);
__decorate([
    (0, common_1.Get)(constants_1.FAVORITE_REQUEST_MAPPING.GET_FAVORITE_BY_ID),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], FavoriteController.prototype, "getFavoriteById", null);
__decorate([
    (0, common_1.Delete)(constants_1.FAVORITE_REQUEST_MAPPING.REMOVE_FAVORITE),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], FavoriteController.prototype, "removeFavorite", null);
FavoriteController = __decorate([
    (0, common_1.Controller)(constants_1.ROUTEPATH),
    __metadata("design:paramtypes", [favorite_service_1.FavoriteService])
], FavoriteController);
exports.FavoriteController = FavoriteController;
//# sourceMappingURL=favorite.controller.js.map