import 'package:dartz/dartz.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/authentication/domain/repositories/repository_authentication.dart';


class DeleteToken implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  DeleteToken(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams) {
    // TODO: implement call
    return repository.deleteToken();
  }
}
