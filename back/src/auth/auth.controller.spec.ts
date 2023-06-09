import { Test, TestingModule } from '@nestjs/testing';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { SignInDto } from './dto/signInDto';
import { SignUpDto } from './dto/signUpDto';
import { User } from './../users/entity/user.entity';

describe('AuthController', () => {
  let controller: AuthController;
  let authService: AuthService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AuthController],
      providers: [
        {
          provide: AuthService,
          useValue: {
            signIn: jest.fn(),
            signUp: jest.fn(),
          },
        },
      ],
    }).compile();

    controller = module.get<AuthController>(AuthController);
    authService = module.get<AuthService>(AuthService);
  });

  describe('signIn', () => {
    it('should return an access token and user', async () => {
      const signInDto: SignInDto = {
        email: 'test@example.com',
        password: 'password',
      };
      const user: User = {
        userId: '1',
        email: 'test@example.com',
        userName: 'Test User',
        password: 'hashed_password',
        isAdmin: false,
      };
      const result = {
        access_token: 'access_token',
        user: user,
      };
      jest.spyOn(authService, 'signIn').mockResolvedValue(result);

      expect(await controller.signIn(signInDto)).toBe(result);
      expect(authService.signIn).toHaveBeenCalledWith(
        signInDto.email,
        signInDto.password,
      );
    });
  });

  describe('signUp', () => {
    it('should create a new user and return an access token and user', async () => {
      const signUpDto: SignUpDto = {
        email: 'test@example.com',
        password: 'password',
        userName: 'Test User',
        isAdmin: false,
      };
      const user: User = {
        userId: '1',
        email: 'test@example.com',
        userName: 'Test User',
        password: 'hashed_password',
        isAdmin: false,
      };
      const result = {
        access_token: 'access_token',
        user: user,
      };
      jest.spyOn(authService, 'signUp').mockResolvedValue(result);

      expect(await controller.signUp(signUpDto)).toBe(result);
      expect(authService.signUp).toHaveBeenCalledWith(
        signUpDto.email,
        signUpDto.password,
        signUpDto.userName,
        signUpDto.isAdmin,
      );
    });
  });

  describe('getProfile', () => {
    it('should return the authenticated user profile', () => {
      const user: User = {
        userId: '1',
        email: 'test@example.com',
        userName: 'Test User',
        password: 'hashed_password',
        isAdmin: false,
      };
      const request = { user: user };
      expect(controller.getProfile(request)).toBe(user);
    });
  });
});
