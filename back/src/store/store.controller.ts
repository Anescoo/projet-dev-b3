import { Controller, Get } from '@nestjs/common';
import { StoreService } from './store.service';

@Controller({
  path: 'api/v1/',
})
export class StoreController {
  constructor(private readonly storeService: StoreService) {}

  @Get()
  getHello(): string {
    return this.storeService.getHello();
  }
}
