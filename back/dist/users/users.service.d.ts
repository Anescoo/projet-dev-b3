import { Repository } from 'typeorm';
import { User } from './entity/user.entity';
export declare class UsersService {
    private usersRepository;
    constructor(usersRepository: Repository<User>);
    createUser(user: User): Promise<User>;
    findAll(): Promise<User[]>;
    findById(id: string): Promise<User | null>;
    findByMail(email: string): Promise<User | null>;
    remove(id: string): Promise<void>;
}
