import { Controller, Delete, Get, Param, Post } from '@nestjs/common';
import { USER_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { User } from './entity/user.entity';
import { UsersService } from './users.service';
import { idDto } from './../idDto';
import { emailDto } from './../emailDto';
import { CreateUserDto } from './dto/createUserDto';

@Controller(ROUTEPATH)
export class UsersController {
  constructor(private usersService: UsersService) {}
  @Post(USER_REQUEST_MAPPING.CREATE_USER)
  createUser(user: CreateUserDto): Promise<User> {
    return this.usersService.createUser(user);
  }
  @Get(USER_REQUEST_MAPPING.GET_ALL_USER)
  getAllUsers(): Promise<User[]> {
    return this.usersService.findAll();
  }
  @Get(USER_REQUEST_MAPPING.GET_USER_BY_ID)
  getUserById(@Param() id: idDto): Promise<User | null> {
    return this.usersService.findById(id);
  }

  @Get(USER_REQUEST_MAPPING.GET_USER_BY_EMAIL)
  getUserByEmail(@Param() email: emailDto): Promise<User | null> {
    return this.usersService.findByMail(email);
  }

  @Delete(USER_REQUEST_MAPPING.REMOVE_USER)
  removeUser(@Param() id: string): Promise<void> {
    return this.usersService.remove(id);
  }
}
