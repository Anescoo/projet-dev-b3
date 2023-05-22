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
exports.OrderController = void 0;
const common_1 = require("@nestjs/common");
const orders_service_1 = require("./orders.service");
const order_entity_1 = require("./entity/order.entity");
const constants_1 = require("./../constants");
let OrderController = class OrderController {
    constructor(OrderService) {
        this.OrderService = OrderService;
    }
    createOrder(Order) {
        return this.OrderService.createOrder(Order);
    }
    getAllOrders() {
        return this.OrderService.findAll();
    }
    getOrderById(id) {
        return this.OrderService.findById(id);
    }
    removeOrder(id) {
        return this.OrderService.remove(id);
    }
};
__decorate([
    (0, common_1.Post)(constants_1.ORDER_REQUEST_MAPPING.CREATE_ORDER),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [order_entity_1.Order]),
    __metadata("design:returntype", Promise)
], OrderController.prototype, "createOrder", null);
__decorate([
    (0, common_1.Get)(constants_1.ORDER_REQUEST_MAPPING.GET_ALL_ORDERS),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], OrderController.prototype, "getAllOrders", null);
__decorate([
    (0, common_1.Get)(constants_1.ORDER_REQUEST_MAPPING.GET_ORDER_BY_ID),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], OrderController.prototype, "getOrderById", null);
__decorate([
    (0, common_1.Delete)(constants_1.ORDER_REQUEST_MAPPING.REMOVE_ORDER),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], OrderController.prototype, "removeOrder", null);
OrderController = __decorate([
    (0, common_1.Controller)(constants_1.ROUTEPATH),
    __metadata("design:paramtypes", [orders_service_1.OrderService])
], OrderController);
exports.OrderController = OrderController;
//# sourceMappingURL=orders.controller.js.map