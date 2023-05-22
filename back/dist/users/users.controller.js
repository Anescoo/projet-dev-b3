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
var _a;
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersController = void 0;
const common_1 = require("@nestjs/common");
const constants_1 = require("./../constants");
const users_service_1 = require("./users.service");
const createUserDto_1 = require("./dto/createUserDto");
let UsersController = class UsersController {
    constructor(usersService) {
        this.usersService = usersService;
    }
    createUser(UserDto) {
        return this.usersService.createUser(UserDto);
    }
    getAllUsers() {
        return this.usersService.findAll();
    }
    getUserById(id) {
        return this.usersService.findById(id);
    }
    getUserByEmail(email) {
        return this.usersService.findByMail(email);
    }
    removeUser(id) {
        return this.usersService.remove(id);
    }
};
__decorate([
    (0, common_1.Post)(constants_1.USER_REQUEST_MAPPING.CREATE_USER),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [typeof (_a = typeof createUserDto_1.CreateUserDto !== "undefined" && createUserDto_1.CreateUserDto) === "function" ? _a : Object]),
    __metadata("design:returntype", Promise)
], UsersController.prototype, "createUser", null);
__decorate([
    (0, common_1.Get)(constants_1.USER_REQUEST_MAPPING.GET_ALL_USER),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], UsersController.prototype, "getAllUsers", null);
__decorate([
    (0, common_1.Get)(constants_1.USER_REQUEST_MAPPING.GET_USER_BY_ID),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], UsersController.prototype, "getUserById", null);
__decorate([
    (0, common_1.Get)(constants_1.USER_REQUEST_MAPPING.GET_USER_BY_EMAIL),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], UsersController.prototype, "getUserByEmail", null);
__decorate([
    (0, common_1.Delete)(constants_1.USER_REQUEST_MAPPING.REMOVE_USER),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], UsersController.prototype, "removeUser", null);
UsersController = __decorate([
    (0, common_1.Controller)(constants_1.ROUTEPATH),
    __metadata("design:paramtypes", [users_service_1.UsersService])
], UsersController);
exports.UsersController = UsersController;
//# sourceMappingURL=users.controller.js.map