import { User } from '../../users/entity/user.entity';
export declare class CreateOrderDto {
    user: User;
    status: string;
    created_at: Date;
    updated_at: Date;
}
