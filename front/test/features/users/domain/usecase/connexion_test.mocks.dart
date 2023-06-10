// Mocks generated by Mockito 5.4.1 from annotations
// in front/test/features/users/domain/usecase/connexion_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:front/core/utils/data_state.dart' as _i2;
import 'package:front/features/users/domain/entity/user.dart' as _i5;
import 'package:front/features/users/domain/repository/user_local_repository.dart'
    as _i6;
import 'package:front/features/users/domain/repository/user_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  @override
  _i4.Future<_i2.DataState<dynamic>> connexion(List<String>? usr) =>
      (super.noSuchMethod(
        Invocation.method(
          #connexion,
          [usr],
        ),
        returnValue:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #connexion,
            [usr],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #connexion,
            [usr],
          ),
        )),
      ) as _i4.Future<_i2.DataState<dynamic>>);
  @override
  _i4.Future<_i2.DataState<dynamic>> inscription(List<String>? usr) =>
      (super.noSuchMethod(
        Invocation.method(
          #inscription,
          [usr],
        ),
        returnValue:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #inscription,
            [usr],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #inscription,
            [usr],
          ),
        )),
      ) as _i4.Future<_i2.DataState<dynamic>>);
  @override
  void removeUser(_i5.User? usr) => super.noSuchMethod(
        Invocation.method(
          #removeUser,
          [usr],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.DataState<List<dynamic>>> getFavoriteProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteProducts,
          [],
        ),
        returnValue: _i4.Future<_i2.DataState<List<dynamic>>>.value(
            _FakeDataState_0<List<dynamic>>(
          this,
          Invocation.method(
            #getFavoriteProducts,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<List<dynamic>>>.value(
                _FakeDataState_0<List<dynamic>>(
          this,
          Invocation.method(
            #getFavoriteProducts,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DataState<List<dynamic>>>);
  @override
  _i4.Future<_i2.DataState<dynamic>> updateUser(_i5.User? usr) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUser,
          [usr],
        ),
        returnValue:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #updateUser,
            [usr],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #updateUser,
            [usr],
          ),
        )),
      ) as _i4.Future<_i2.DataState<dynamic>>);
}

/// A class which mocks [UserLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalRepository extends _i1.Mock
    implements _i6.UserLocalRepository {
  @override
  void addUser(_i5.User? usr) => super.noSuchMethod(
        Invocation.method(
          #addUser,
          [usr],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<String> getToken() => (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
        returnValueForMissingStub: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  void deleteUser() => super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<dynamic> getFavoriteProducts() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteProducts,
          [],
        ),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as List<dynamic>);
}
