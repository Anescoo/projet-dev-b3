import { Repository } from 'typeorm';
import { User } from './entity/user.entity';
import { idDto } from 'src/idDto';
import { emailDto } from 'src/emailDto';
import { CreateUserDto } from './dto/createUserDto';
export declare class UsersService {
    private usersRepository;
    constructor(usersRepository: Repository<User>);
    createUser(user: CreateUserDto): Promise<User>;
    findAll(): Promise<User[]>;
    findById(id: idDto): Promise<User | null>;
    findByMail(email: emailDto): Promise<User | null>;
    remove(id: string): Promise<void>;
}
