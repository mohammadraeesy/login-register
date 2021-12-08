import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';


abstract class ActivationRepository {
  Future<Either<Failure, bool>> sendCodeActivation(String code , String username);
}