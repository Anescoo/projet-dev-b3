import { Module } from '@nestjs/common';
import { StoreController } from './store.controller';
import { StoreService } from './store.service';
import { TypeOrmModule, getRepositoryToken } from '@nestjs/typeorm';
import { Store } from './entity/store.entity';
import { Repository } from 'typeorm';
StoreMockRepository: Repository<Store>;
@Module({
  imports: [TypeOrmModule.forFeature([Store])],
  controllers: [StoreController],
  providers: [
    StoreService,
    {
      provide: getRepositoryToken(Store),
      useValue: Repository<Store>,
    },
  ],
  exports: [TypeOrmModule],
})
export class StoreModule {}
