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
@Controller(ROUTEPATH)
export class AuthController {
  constructor(private authService: AuthService) {}

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post(AUTH_REQUEST_MAPPING.SIGN_IN)
  signIn(@Body() signInDto: SignInDto) {
    return this.authService.signIn(signInDto.email, signInDto.password);
  }

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post(AUTH_REQUEST_MAPPING.SIGN_UP)
  signUp(@Body() signUpDto: SignUpDto) {
    return this.authService.signUp(
      signUpDto.email,
      signUpDto.password,
      signUpDto.userName,
      signUpDto.isAdmin,
    );
  }
  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
