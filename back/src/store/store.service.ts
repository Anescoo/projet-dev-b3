import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Store } from './entity/store.entity';
@Injectable()
export class StoreService {
  constructor(
    @InjectRepository(Store)
    private storeRepository: Repository<Store>,
  ) {}

  findAll(): Promise<Store[]> {
    return this.storeRepository.find();
  }

  findOne(id: number): Promise<Store | null> {
    return this.storeRepository.findOneBy({ id });
  }

  async remove(id: number): Promise<void> {
    await this.storeRepository.delete(id);
  }
  getHello(): string {
    return 'Hello from store';
  }
}
