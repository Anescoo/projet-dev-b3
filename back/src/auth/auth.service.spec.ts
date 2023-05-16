import { Test, TestingModule } from '@nestjs/testing';
import { AuthService } from './auth.service';
import { UsersService } from './../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { UnauthorizedException } from '@nestjs/common';
import { User } from './../users/entity/user.entity';

//! je ne sais pas comment faire ce test car le mot de passe génére utilise des notion d'aléatioir
describe.skip('AuthService', () => {
  let authService: AuthService;
  let usersService: UsersService;
  let jwtService: JwtService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthService,
        {
          provide: UsersService,
          useValue: {
            findByMail: jest.fn(),
            createUser: jest.fn(),
          },
        },
        {
          provide: JwtService,
          useValue: {
            signAsync: jest.fn(),
          },
        },
      ],
    }).compile();

    authService = module.get<AuthService>(AuthService);
    usersService = module.get<UsersService>(UsersService);
    jwtService = module.get<JwtService>(JwtService);
  });

  describe('signIn', () => {
    it('should return an access token when given valid credentials', async () => {
      const mockAccessToken = 'mock.access.token';
      const mockUser = new User();
      (mockUser.email = 'test@test.com'),
        (mockUser.password = 'password'),
        (mockUser.userId = '123'),
        jest.spyOn(jwtService, 'signAsync').mockResolvedValue(mockAccessToken);

      const result = await authService.signIn(
        mockUser.email,
        mockUser.password,
      );

      expect(result).toEqual({ access_token: mockAccessToken });
      // expect(jwtService.signAsync).toHaveBeenCalledWith({
      //   userEmail: mockUser.email,
      //   sub: mockUser.userId,
      // });
    });

    it('should throw an UnauthorizedException when given invalid credentials', async () => {
      const mockUser = new User();
      (mockUser.email = 'test@test.com'),
        (mockUser.password = 'password'),
        (mockUser.userId = '123'),
        jest.spyOn(usersService, 'findByMail').mockResolvedValue(mockUser);

      try {
        await authService.signIn(mockUser.email, 'invalid-password');
      } catch (error) {
        expect(error).toBeInstanceOf(UnauthorizedException);
        expect(usersService.findByMail).toHaveBeenCalledWith(mockUser.email);
      }
    });

    it('should throw an UnauthorizedException when given a non-existent email', async () => {
      const mockEmail = 'non-existent-email@test.com';

      jest.spyOn(usersService, 'findByMail').mockResolvedValue(null);

      try {
        await authService.signIn(mockEmail, 'password');
      } catch (error) {
        expect(error).toBeInstanceOf(UnauthorizedException);
        expect(usersService.findByMail).toHaveBeenCalledWith(mockEmail);
      }
    });
  });

  describe('signUp', () => {
    it('should create a new user and return an access token when given valid input', async () => {
      const mockAccessToken = 'mock.access.token';
      const mockUser = new User();
      mockUser.email = 'test@test.com';
      mockUser.password = 'password';
      mockUser.userName = 'Test User';
      mockUser.isAdmin = false;
      mockUser.userId = '123';

      jest.spyOn(usersService, 'findByMail').mockResolvedValue(null);
      const createUserSpy = jest.spyOn(usersService, 'createUser');

      jest.spyOn(jwtService, 'signAsync').mockResolvedValue(mockAccessToken);

      const result = await authService.signUp(
        mockUser.email,
        mockUser.password,
        mockUser.userName,
        mockUser.isAdmin,
      );

      expect(result).toEqual({ access_token: mockAccessToken });
      expect(usersService.findByMail).toHaveBeenCalledWith(mockUser.email);

      expect(createUserSpy).toHaveBeenCalledWith({
        email: mockUser.email,
        password: mockUser.password,
        userName: mockUser.userName,
        isAdmin: mockUser.isAdmin,
      });

      expect(jwtService.signAsync).toHaveBeenCalled();
    });

    it('should throw an UnauthorizedException when given an email that already exists', async () => {
      const mockUser = new User();
      mockUser.email = 'test@test.com';
      mockUser.password = 'password';
      mockUser.userName = 'Test User';
      mockUser.isAdmin = false;
      mockUser.userId = '123';

      jest.spyOn(usersService, 'findByMail').mockResolvedValue(mockUser);

      try {
        await authService.signUp(
          mockUser.email,
          mockUser.password,
          mockUser.userName,
          mockUser.isAdmin,
        );
      } catch (error) {
        expect(error).toBeInstanceOf(UnauthorizedException);
        expect(error.message).toEqual('user already exist');
        expect(usersService.findByMail).toHaveBeenCalledWith(mockUser.email);
      }
    });
  });
});
