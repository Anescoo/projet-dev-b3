import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
//todo: appliqué les modification des colomne aux autres entités
@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  userId: string;

  @Column({ type: 'varchar', length: 20, nullable: false })
  userName: string;

  @Column({ type: 'varchar', length: 20, nullable: false })
  email: string;

  @Column({ type: 'varchar', length: 250, nullable: false })
  password: string;

  @Column({ default: false })
  isAdmin: boolean;
}
