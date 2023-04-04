import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { StoreModule } from './store/store.module';
@Module({
  imports: [StoreModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
