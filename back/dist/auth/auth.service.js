"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const jwt_1 = require("@nestjs/jwt");
const users_service_1 = require("./../users/users.service");
const user_entity_1 = require("./../users/entity/user.entity");
const secureData_1 = require("./secureData");
const emailDto_1 = require("./../emailDto");
let AuthService = class AuthService {
    constructor(usersService, jwtService) {
        this.usersService = usersService;
        this.jwtService = jwtService;
    }
    async signIn(userEmail, pass) {
        const security = new secureData_1.SecureData();
        const mail = new emailDto_1.emailDto();
        mail.email = userEmail;
        const user = await this.usersService.findByMail(mail);
        const isPasswordMatched = await security.isHashDataMatch(pass, user.password);
        if (!user || !isPasswordMatched) {
            throw new common_1.UnauthorizedException('fail auth');
        }
        const payload = { userEmail: user.email, sub: user.userId };
        return {
            access_token: await this.jwtService.signAsync(payload),
            user: user,
        };
    }
    async signUp(userEmail, pass, name, isAdmin) {
        const security = new secureData_1.SecureData();
        const mail = new emailDto_1.emailDto();
        mail.email = userEmail;
        const userAlreadyExist = await this.usersService.findByMail(mail);
        if (userAlreadyExist) {
            throw new common_1.UnauthorizedException('user already exist');
        }
        const hashedPwd = await security.hashData(pass);
        const newUser = new user_entity_1.User();
        newUser.email = userEmail;
        newUser.password = hashedPwd;
        newUser.userName = name;
        newUser.isAdmin = isAdmin;
        await this.usersService.createUser(newUser);
        const payload = { userEmail: newUser.email, sub: newUser.userId };
        return {
            access_token: await this.jwtService.signAsync(payload),
            user: newUser,
        };
    }
};
AuthService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [users_service_1.UsersService,
        jwt_1.JwtService])
], AuthService);
exports.AuthService = AuthService;
//# sourceMappingURL=auth.service.js.map