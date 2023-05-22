"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var AppModule_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const app_controller_1 = require("./app.controller");
const app_service_1 = require("./app.service");
const auth_service_1 = require("./auth/auth.service");
const auth_controller_1 = require("./auth/auth.controller");
const auth_module_1 = require("./auth/auth.module");
const users_module_1 = require("./users/users.module");
const typeorm_1 = require("@nestjs/typeorm");
const products_module_1 = require("./products/products.module");
const orders_module_1 = require("./orders/orders.module");
const order_entity_1 = require("./orders/entity/order.entity");
const orderItem_entity_1 = require("./orders/entity/orderItem.entity");
const product_entity_1 = require("./products/entity/product.entity");
const productReview_entity_1 = require("./productReview/productReview.entity");
const user_entity_1 = require("./users/entity/user.entity");
const favorite_entity_1 = require("./favorite/entity/favorite.entity");
let AppModule = AppModule_1 = class AppModule {
};
AppModule = AppModule_1 = __decorate([
    (0, common_1.Module)({
        imports: [
            auth_module_1.AuthModule,
            users_module_1.UsersModule,
            typeorm_1.TypeOrmModule.forRoot({
                type: 'postgres',
                host: 'dpg-chk6o0e7avj217c964tg-a.frankfurt-postgres.render.com',
                port: 5432,
                username: 'app_user',
                password: 'sA49LtdEt30pBLCjcDONVUiHF0S12R5u',
                database: 'app_db_p3l5',
                entities: [order_entity_1.Order, orderItem_entity_1.OrderItem, product_entity_1.Product, productReview_entity_1.ProductReview, user_entity_1.User, favorite_entity_1.Favorite],
                synchronize: true,
                logging: true,
                ssl: true,
            }),
            products_module_1.ProductsModule,
            orders_module_1.OrdersModule,
        ],
        controllers: [app_controller_1.AppController, auth_controller_1.AuthController],
        providers: [app_service_1.AppService, auth_service_1.AuthService],
        exports: [AppModule_1],
    })
], AppModule);
exports.AppModule = AppModule;
//# sourceMappingURL=app.module.js.map