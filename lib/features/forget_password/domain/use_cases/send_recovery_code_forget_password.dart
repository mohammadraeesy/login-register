import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/forget_password/domain/repositories/forget_password_repository.dart';


class SendRecoveryCodeUseCase extends UseCase<bool , SendRecoveryCodeParams>{
  final ForgetPasswordRepository repository;

  SendRecoveryCodeUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SendRecoveryCodeParams params) async{
    // TODO: implement call
    return await repository.sendRecoveryCode(params.email);
  }

}
class SendRecoveryCodeParams extends Equatable{
  final email;

  SendRecoveryCodeParams({@required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}