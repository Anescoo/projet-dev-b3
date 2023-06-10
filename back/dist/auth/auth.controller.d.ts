import { AuthService } from './auth.service';
import { SignInDto } from './dto/signInDto';
import { SignUpDto } from './dto/signUpDto';
import { User } from './../users/entity/user.entity';
export declare class AuthController {
    private authService;
    constructor(authService: AuthService);
    signIn(signInDto: SignInDto): Promise<{
        access_token: string;
        user: User;
        statusCode: number;
    }>;
    signUp(signUpDto: SignUpDto): Promise<{
        access_token: string;
        user: User;
        statusCode: number;
    }>;
    getProfile(req: any): any;
}
