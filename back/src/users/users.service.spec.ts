import { Test, TestingModule } from '@nestjs/testing';
import { UsersService } from './users.service';
import { Repository } from 'typeorm';
import { User } from './entity/user.entity';
import { getRepositoryToken } from '@nestjs/typeorm';

describe('UsersService', () => {
  let service: UsersService;
  let repository: Repository<User>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        {
          provide: getRepositoryToken(User),
          useClass: Repository,
        },
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
    repository = module.get<Repository<User>>(getRepositoryToken(User));
  });

  afterEach(() => {
    jest.resetAllMocks();
  });

  describe('createUser', () => {
    it('should create a user', async () => {
      const user = new User();
      user.email = 'test@example.com';
      user.password = 'password';
      jest.spyOn(repository, 'save').mockResolvedValue(user);

      const result = await service.createUser(user);
      expect(repository.save).toHaveBeenCalledWith(user);
      expect(result).toEqual(user);
    });
  });

  describe('findAll', () => {
    it('should return an array of users', async () => {
      const users = [new User(), new User()];
      jest.spyOn(repository, 'find').mockResolvedValue(users);

      const result = await service.findAll();
      expect(repository.find).toHaveBeenCalled();
      expect(result).toEqual(users);
    });
  });

  describe('findById', () => {
    it('should return a user with the given ID', async () => {
      const user = new User();
      user.userId = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(repository, 'findOneBy').mockResolvedValue(user);

      const result = await service.findById(user.userId);
      expect(repository.findOneBy).toHaveBeenCalledWith({
        userId: user.userId,
      });
      expect(result).toEqual(user);
    });

    it('should return null if no user is found', async () => {
      jest.spyOn(repository, 'findOneBy').mockResolvedValue(null);

      const result = await service.findById(
        '550e8400-e29b-41d4-a716-446655440000',
      );
      expect(repository.findOneBy).toHaveBeenCalledWith({
        userId: '550e8400-e29b-41d4-a716-446655440000',
      });
      expect(result).toBeNull();
    });
  });

  describe('findByMail', () => {
    it('should return a user with the given email', async () => {
      const user = new User();
      user.email = 'test@example.com';
      jest.spyOn(repository, 'findOneBy').mockResolvedValue(user);

      const result = await service.findByMail(user.email);
      expect(repository.findOneBy).toHaveBeenCalledWith({ email: user.email });
      expect(result).toEqual(user);
    });

    it('should return null if no user is found', async () => {
      jest.spyOn(repository, 'findOneBy').mockResolvedValue(null);

      const result = await service.findByMail('test@example.com');
      expect(repository.findOneBy).toHaveBeenCalledWith({
        email: 'test@example.com',
      });
      expect(result).toBeNull();
    });
  });

  describe('remove', () => {
    it('should remove a user with the given ID', async () => {
      const userId = '550e8400-e29b-41d4-a716-446655440000';
      jest.spyOn(repository, 'delete').mockResolvedValue(undefined);
    });
  });
});
