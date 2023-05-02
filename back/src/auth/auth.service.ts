import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from './../users/users.service';
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
    const user = await this.usersService.findByMail(userEmail);

    if (!user || user.password !== pass) {
      throw new UnauthorizedException();
    }

    const payload = { userEmail: user.email, sub: user.userId };
    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  }
  signUp(): Promise<{ access_token: string }> {
    return null;
  }
}
