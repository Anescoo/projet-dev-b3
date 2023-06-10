import { User } from './entity/user.entity';
import { UsersService } from './users.service';
import { idDto } from './../idDto';
import { emailDto } from './../emailDto';
import { CreateUserDto } from './dto/createUserDto';
export declare class UsersController {
    private usersService;
    constructor(usersService: UsersService);
    createUser(user: CreateUserDto): Promise<User>;
    getAllUsers(): Promise<User[]>;
    getUserById(id: idDto): Promise<User | null>;
    getUserByEmail(email: emailDto): Promise<User | null>;
    removeUser(id: string): Promise<void>;
}
