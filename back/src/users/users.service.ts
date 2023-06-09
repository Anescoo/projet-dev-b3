import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entity/user.entity';
import { idDto } from 'src/idDto';
import { emailDto } from 'src/emailDto';
import { CreateUserDto } from './dto/createUserDto';
@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}
  createUser(user: CreateUserDto): Promise<User> {
    return this.usersRepository.save(user);
  }

  findAll(): Promise<User[]> {
    return this.usersRepository.find();
  }

  findById(id: idDto): Promise<User | null> {
    return this.usersRepository.findOneBy({
      userId: id.id, // where id is your column name
    });
  }

  findByMail(email: emailDto): Promise<User | null> {
    return this.usersRepository.findOneBy({
      email: email.email, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.usersRepository.delete(id);
  }
}
