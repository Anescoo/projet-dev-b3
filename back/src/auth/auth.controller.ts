import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpException,
  HttpStatus,
  Post,
  Request,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { Public } from './decorators/public.decorator';
import { AUTH_REQUEST_MAPPING, ROUTEPATH } from './../constants';
import { SignInDto } from './dto/signInDto';
import { SignUpDto } from './dto/signUpDto';
//Todo: encrypter els infos partagées
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
    try {
      return this.authService.signUp(
        signUpDto.email,
        signUpDto.password,
        signUpDto.userName,
        signUpDto.isAdmin,
      );
    } catch (error) {
      //TODO: vérifier ce code
      throw new HttpException(
        {
          status: HttpStatus.FORBIDDEN,
          error: `error : ${{ error }}`,
        },
        HttpStatus.FORBIDDEN,
        {
          cause: error,
        },
      );
    }
  }
  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
