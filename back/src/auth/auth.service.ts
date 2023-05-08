import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from './../users/users.service';
import { User } from './../users/entity/user.entity';
@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async signIn(
    userEmail: string,
    pass: string,
  ): Promise<{ access_token: string }> {
    const user: User = await this.usersService.findByMail(userEmail);

    if (!user || user.password !== pass) {
      throw new UnauthorizedException('fail auth');
    }

    const payload = { userEmail: user.email, sub: user.userId };
    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  }
  async signUp(
    userEmail: string,
    pass: string,
    name: string,
    isAdmin: boolean,
  ): Promise<{ access_token: string }> {
    const userAlreadyExist: User = await this.usersService.findByMail(
      userEmail,
    );
    if (userAlreadyExist) {
      throw new UnauthorizedException('user already exist');
    }
    const newUser = new User();
    newUser.email = userEmail;
    newUser.password = pass;
    newUser.userName = name;
    newUser.isAdmin = isAdmin;
    this.usersService.createUser(newUser);
    const payload = { userEmail: newUser.email, sub: newUser.userId };
    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  }
}
