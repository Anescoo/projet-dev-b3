import { User } from 'src/users/entity/user.entity';
export declare class Order {
    id: number;
    user: User;
    status: string;
    created_at: Date;
    updated_at: Date;
}
