import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/exceptions.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/network/network_info.dart';
import 'package:login_register/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:login_register/features/register/data/models/register_model.dart';
import 'package:login_register/features/register/domain/repositories/register_repository.dart';


class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> register(String username,
      String password,
      String firstname,
      String lastname,
      String phonenumber,
      String email) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await remoteDataSource.register(RegisterModel(
            username: username,
            password: password,
            phonenumber: phonenumber,
            email: email,
            firstname: firstname,
            lastname: lastname));
        if (respons) {
          return Right(respons);
        } else {
          return Right(respons);
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw ServerFailure();
    }
  }
}