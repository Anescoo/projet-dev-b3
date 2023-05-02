import { Test, TestingModule } from '@nestjs/testing';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { User } from './entity/user.entity';

describe('UsersController', () => {
  let controller: UsersController;
  let service: UsersService;
  let repository: Repository<User>;

  const user1 = new User();
  (user1.userId = '1'),
    (user1.userName = 'John'),
    (user1.email = 'john@example.com'),
    (user1.password = 'password'),
    (user1.idAdmin = false);

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UsersController],
      providers: [
        UsersService,
        {
          provide: getRepositoryToken(User),
          useClass: Repository,
        },
      ],
    }).compile();

    controller = module.get<UsersController>(UsersController);
    service = module.get<UsersService>(UsersService);
    repository = module.get<Repository<User>>(getRepositoryToken(User));
  });

  describe('createUser', () => {
    it('should return the created user', async () => {
      jest.spyOn(service, 'createUser').mockResolvedValue(user1);
      const result = await controller.createUser(user1);
      expect(result).toBe(user1);
    });
  });

  describe('getAllUsers', () => {
    it('should return an array of users', async () => {
      jest.spyOn(service, 'findAll').mockResolvedValue([user1]);
      const result = await controller.getAllUsers();
      expect(result).toEqual([user1]);
    });
  });

  describe('getUserById', () => {
    it('should return the user with the given id', async () => {
      jest.spyOn(service, 'findById').mockResolvedValue(user1);
      const result = await controller.getUserById('1');
      expect(result).toBe(user1);
    });

    it('should return null if the user with the given id is not found', async () => {
      jest.spyOn(service, 'findById').mockResolvedValue(null);
      const result = await controller.getUserById('999');
      expect(result).toBeNull();
    });
  });

  describe('getUserByEmail', () => {
    it('should return the user with the given email', async () => {
      jest.spyOn(service, 'findByMail').mockResolvedValue(user1);
      const result = await controller.getUserByEmail('john@example.com');
      expect(result).toBe(user1);
    });

    it('should return null if the user with the given email is not found', async () => {
      jest.spyOn(service, 'findByMail').mockResolvedValue(null);
      const result = await controller.getUserByEmail('notfound@example.com');
      expect(result).toBeNull();
    });
  });

  describe('removeUser', () => {
    it('should call the service method to remove the user with the given id', async () => {
      jest.spyOn(service, 'remove').mockResolvedValue(undefined);
      await controller.removeUser('1');
      expect(service.remove).toHaveBeenCalledWith('1');
    });
  });
});
