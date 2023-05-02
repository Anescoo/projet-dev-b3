import { Controller, Delete, Get, Post } from '@nestjs/common';
import { USER_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { User } from './entity/user.entity';
import { UsersService } from './users.service';

@Controller(ROUTEPATH)
export class UsersController {
  constructor(private usersService: UsersService) {}
  @Post(USER_REQUEST_MAPPING.CREATE_USER)
  createUser(user: User): Promise<User> {
    return this.usersService.createUser(user);
  }
  @Get(USER_REQUEST_MAPPING.GET_ALL_USER)
  getAllUsers(): Promise<User[]> {
    return this.usersService.findAll();
  }
  @Get(USER_REQUEST_MAPPING.GET_USER_BY_ID)
  getUserById(id: string): Promise<User | null> {
    return this.usersService.findById(id);
  }

  @Get(USER_REQUEST_MAPPING.GET_USER_BY_EMAIL)
  getUserByEmail(email: string): Promise<User | null> {
    return this.usersService.findByMail(email);
  }

  @Delete(USER_REQUEST_MAPPING.REMOVE_USER)
  removeUser(id: string): Promise<void> {
    return this.usersService.remove(id);
  }
}
