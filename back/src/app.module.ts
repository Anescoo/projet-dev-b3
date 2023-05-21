import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthService } from './auth/auth.service';
import { AuthController } from './auth/auth.controller';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProductsModule } from './products/products.module';
import { OrdersModule } from './orders/orders.module';
import { Order } from './orders/entity/order.entity';
import { OrderItem } from './orders/entity/orderItem.entity';
import { Product } from './products/entity/product.entity';
import { ProductReview } from './productReview/productReview.entity';
import { User } from './users/entity/user.entity';
import { Favorite } from './favorite/entity/favorite.entity';
/**
 * !FIX BDD CONNEXION FOR DEPLOY
 * !la connexion avec une bdd externe marche pas : avec celle de georgio blem de permission et celle de
 * ! render je sais mm plus .
 * ! utiliser dotenv pour les credentials
 * *Pour le moment il faut utiliser une bdd local
 */
@Module({
  imports: [
    AuthModule,
    UsersModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'dpg-chk6o0e7avj217c964tg-a.frankfurt-postgres.render.com',
      port: 5432,
      username: 'app_user',
      password: 'sA49LtdEt30pBLCjcDONVUiHF0S12R5u',
      database: 'app_db_p3l5',
      entities: [Order, OrderItem, Product, ProductReview, User, Favorite],
      synchronize: true,
      logging: true,
      ssl: true,
    }),
    ProductsModule,
    OrdersModule,
  ],
  controllers: [AppController, AuthController],
  providers: [AppService, AuthService],
  exports: [AppModule],
})
export class AppModule {}
