import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';
import 'package:login_register/features/authentication/domain/repositories/repository_authentication.dart';

class SaveToken implements UseCase<bool,Params>{
  final AuthenticationRepository repository;

  SaveToken(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) {
    AuthenticationEntity tempAuthentication = AuthenticationEntity(
        token: params.token,
        expiredToken: params.expiredToken,
        refreshToken: params.refreshToken);
    return repository.saveToken(tempAuthentication);
  }

}
class Params extends Equatable{
  final token ;
  final refreshToken;
  final expiredToken;

  Params({@required this.token,@required this.refreshToken,@required this.expiredToken});

  @override
  // TODO: implement props
  List<Object> get props =>[token,refreshToken,expiredToken];

}