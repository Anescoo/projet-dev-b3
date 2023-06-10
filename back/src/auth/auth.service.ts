import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from './../users/users.service';
import { User } from './../users/entity/user.entity';
import { SecureData } from './secureData';
import { emailDto } from './../emailDto';
@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}
  async signIn(
    userEmail: string,
    pass: string,
  ): Promise<{ access_token: string; user: User }> {
    const security = new SecureData();
    const mail = new emailDto();
    mail.email = userEmail;
    const user: User = await this.usersService.findByMail(mail);
    const isPasswordMatched = await security.isHashDataMatch(
      pass,
      user.password,
    );
    if (!user || !isPasswordMatched) {
      throw new UnauthorizedException('fail auth');
    }

    const payload = { userEmail: user.email, sub: user.userId };
    return {
      access_token: await this.jwtService.signAsync(payload),
      user: user,
    };
  }
  async signUp(
    userEmail: string,
    pass: string,
    name: string,
    isAdmin: boolean,
  ): Promise<{ access_token: string; user: User }> {
    const security = new SecureData();
    const mail = new emailDto();
    mail.email = userEmail;
    const userAlreadyExist: User = await this.usersService.findByMail(mail);
    if (userAlreadyExist) {
      throw new UnauthorizedException('user already exist');
    }
    const hashedPwd: string = await security.hashData(pass);

    const newUser = new User();
    newUser.email = userEmail;
    newUser.password = hashedPwd;
    newUser.userName = name;
    newUser.isAdmin = isAdmin;
    await this.usersService.createUser(newUser); // attendre la fin de l'insertion
    const payload = { userEmail: newUser.email, sub: newUser.userId };
    return {
      access_token: await this.jwtService.signAsync(payload),
      user: newUser,
    };
  }
}
