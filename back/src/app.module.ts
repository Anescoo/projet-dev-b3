import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthService } from './auth/auth.service';
import { AuthController } from './auth/auth.controller';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Store } from './store/entity/store.entity';

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
      entities: [Store],
      synchronize: true,
    }),
  ],
  controllers: [AppController, AuthController],
  providers: [AppService, AuthService],
})
export class AppModule {}
