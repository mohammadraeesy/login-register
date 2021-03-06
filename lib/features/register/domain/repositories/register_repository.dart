
import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';


abstract class RegisterRepository {
  Future<Either<Failure, bool>> register(
      String firstname, String lastname, String username,String password, String phonenumber, String email);
}