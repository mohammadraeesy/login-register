import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/authentication/domain/repositories/repository_authentication.dart';


class CheckToken implements UseCase<bool,NoParams>{
  final AuthenticationRepository repository;

  CheckToken(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams) {
    // TODO: implement call
    return repository. checkToken();
  }
}