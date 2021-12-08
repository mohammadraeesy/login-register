import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';


abstract class LoginRepository {
  Future<Either<Failure, AuthenticationEntity>> login(
      String username, String password);
}