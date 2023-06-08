import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';
import 'package:front/features/users/domain/usecase/authenticate.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// import './connexion_test.mocks.dart';

// @GenerateMocks([AuthRepository])
void main() {
  // late MockAuthRepository mockAuthRepository;
  late AuthenticateUsecase authenticateUsecase;

  setUp(() {
    // mockAuthRepository = MockAuthRepository();
    // authenticateUsecase = AuthenticateUsecase(mockAuthRepository);
  });

  final tconnexion = {"email": "testoy@gmail.com", "password": "testoy64"};
  final tusr =
      UserModel(email: tconnexion["email"], password: tconnexion["password"]);
  final tnewUser = UserModel(
      usrname: "mockuser",
      email: "mock56@gmail.com",
      password: 'testoy64',
      isAdmin: false);
  final tcurrentUser = User(
      usrname: "mockuser",
      email: "mock56@gmail.com",
      password: 'testoy64',
      isAdmin: false);

  test(
      "should get auth token and user data when logging in a non-existing user",
      () async {
    // when(mockAuthRepository.connexion(tusr)).thenAnswer(
    //     (realInvocation) async =>
    //         Future.value(DataSuccess(tnewUser) as FutureOr<DataState<User>>?));
    // final result = authenticateUsecase.userConnexion(params: tconnexion);

    // expect(result, Future.value(DataSuccess(tcurrentUser)));
    // verify(mockAuthRepository.connexion(tusr));
  });

  test("should get error when logging in an existing user", () async {
    // Implémentez vos assertions et vos actions de test ici
  });

  test(
      "should get auth token and user data for registration if user does not exist",
      () async {
    // Implémentez vos assertions et vos actions de test ici
  });

  test("should get error for registration if user already exists", () async {
    // Implémentez vos assertions et vos actions de test ici
  });
}
