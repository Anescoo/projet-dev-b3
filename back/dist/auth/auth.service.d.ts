import { JwtService } from '@nestjs/jwt';
import { UsersService } from './../users/users.service';
import { User } from './../users/entity/user.entity';
export declare class AuthService {
    private usersService;
    private jwtService;
    constructor(usersService: UsersService, jwtService: JwtService);
    signIn(userEmail: string, pass: string): Promise<{
        access_token: string;
        user: User;
    }>;
    signUp(userEmail: string, pass: string, name: string, isAdmin: boolean): Promise<{
        access_token: string;
        user: User;
    }>;
}
