import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/exceptions.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:login_register/features/authentication/data/models/authentication_model.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';
import 'package:login_register/features/authentication/domain/repositories/repository_authentication.dart';


class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSources dataSources;

  AuthenticationRepositoryImpl({@required this.dataSources});

  @override
  Future<Either<Failure, bool>> deleteToken() async {
    try {
      final bool deleteToken = await dataSources.deleteToken();
      return Right(deleteToken);
    } on CacheException {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> findToken() async {
    final isUserAuthenticated = await dataSources.findToken();
    if (isUserAuthenticated != null) {
      return Right(isUserAuthenticated);
    } else {
      return Left(CacheFailureToken());
    }
  }

  @override
  Future<Either<Failure, bool>> saveToken(
      AuthenticationEntity tempAuthentication) async {
    try {
      dataSources.addAuthentication(AuthenticationModel(
          token: tempAuthentication.token,
          refreshtoken: tempAuthentication.refreshToken,
         expiredtoken: tempAuthentication.expiredToken
      ));
      return Right(true);
    } on CacheException {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, bool>> checkToken() async {
    final token = await dataSources.checkToken();
    if (token) {
      return Right(true);
    } else {
      return Right(false);
    }
  }
}
