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

@Controller(ROUTEPATH)
export class AuthController {
  constructor(private authService: AuthService) {}

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post(AUTH_REQUEST_MAPPING.SIGN_IN)
  signIn(@Body() signInDto: Record<string, any>) {
    return this.authService.signIn(signInDto.userEmail, signInDto.password);
  }

  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
