import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';
import 'package:login_register/features/authentication/domain/repositories/repository_authentication.dart';

class FindToken implements UseCase<AuthenticationEntity,NoParams>{
  final AuthenticationRepository repository;

  FindToken(this.repository);


  @override
  Future<Either<Failure, AuthenticationEntity>> call(NoParams) {
    // TODO: implement call
    return repository.findToken();
  }
}