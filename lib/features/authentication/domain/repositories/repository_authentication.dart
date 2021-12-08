import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';


abstract class AuthenticationRepository{
  Future<Either<Failure, bool>> saveToken(AuthenticationEntity tempAuthentication);
  Future<Either<Failure, bool>> deleteToken();
  Future<Either<Failure, bool>> checkToken();
  Future<Either<Failure, AuthenticationEntity>> findToken();
}