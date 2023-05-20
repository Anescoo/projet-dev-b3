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
import { ProductReview } from './productReview/entity/productReview.entity';
import { User } from './users/entity/user.entity';
import { Favorite } from './favorite/entity/favorite.entity';
/**
 * !FIX BDD CONNEXION FOR DEPLOY
 * !la connexion avec une bdd externe marche pas : avec celle de georgio blem de permission et celle de
 * ! render je sais mm plus .
 * *Pour le moment il faut utiliser une bdd local
 */
@Module({
  imports: [
    AuthModule,
    UsersModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'app_user',
      password: 'secretpassword',
      database: 'app_db',
      entities: [Order, OrderItem, Product, ProductReview, User, Favorite],
      synchronize: true,
    }),
    ProductsModule,
    OrdersModule,
  ],
  controllers: [AppController, AuthController],
  providers: [AppService, AuthService],
  exports: [AppModule],
})
export class AppModule {}
