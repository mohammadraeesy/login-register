import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/exceptions.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/network/network_info.dart';
import 'package:login_register/features/activation/data/data_sources/activation_remote_data_source.dart';
import 'package:login_register/features/activation/data/models/activation_model.dart';
import 'package:login_register/features/activation/domain/repositories/activation_repository.dart';


class ActivationRepositoryImpl implements ActivationRepository {
  final ActivationRemoteDataSources remoteDataSource;
  final NetworkInfo networkInfo;

  ActivationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> sendCodeActivation(
      String code, String username) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await remoteDataSource.sendActivationCode(
            ActivationModel(code: code, username: username));
        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
