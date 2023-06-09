import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entity/user.entity';
@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}
  createUser(user: User): Promise<User> {
    return this.usersRepository.save(user);
  }

  findAll(): Promise<User[]> {
    return this.usersRepository.find();
  }

  findById(id: string): Promise<User | null> {
    return this.usersRepository.findOneBy({
      userId: id, // where id is your column name
    });
  }

  findByMail(email: string): Promise<User | null> {
    return this.usersRepository.findOneBy({
      email: email, // where id is your column name
    });
  }

  async remove(id: string): Promise<void> {
    await this.usersRepository.delete(id);
  }
}
