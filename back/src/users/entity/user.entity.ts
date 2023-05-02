import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  userId: string;

  @Column('varchar', { length: 20 })
  userName: string;

  @Column('varchar', { length: 30 })
  email: string;

  @Column('varchar', { length: 20 })
  password: string;

  @Column({ default: false })
  idAdmin: boolean;
}
