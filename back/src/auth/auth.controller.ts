import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Request,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { Public } from './decorators/public.decorator';
import { AUTH_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { SignInDto } from './dto/signInDto';
import { SignUpDto } from './dto/signUpDto';
import { User } from './../users/entity/user.entity';
@Controller(ROUTEPATH)
export class AuthController {
  constructor(private authService: AuthService) {}

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post(AUTH_REQUEST_MAPPING.SIGN_IN)
  async signIn(
    @Body() signInDto: SignInDto,
  ): Promise<{ access_token: string; user: User; statusCode: number }> {
    const result = await this.authService.signIn(
      signInDto.email,
      signInDto.password,
    );

    return {
      access_token: result.access_token,
      user: result.user,
      statusCode: HttpStatus.OK,
    };
  }

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post(AUTH_REQUEST_MAPPING.SIGN_UP)
  async signUp(
    @Body() signUpDto: SignUpDto,
  ): Promise<{ access_token: string; user: User; statusCode: number }> {
    const result = await this.authService.signUp(
      signUpDto.email,
      signUpDto.password,
      signUpDto.userName,
      signUpDto.isAdmin,
    );

    return {
      access_token: result.access_token,
      user: result.user,
      statusCode: HttpStatus.OK,
    };
  }
  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
