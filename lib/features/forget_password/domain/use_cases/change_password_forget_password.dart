import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/forget_password/domain/repositories/forget_password_repository.dart';



class ChangePasswordUseCase extends UseCase<bool , ChangePasswordParams>{
  final ForgetPasswordRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ChangePasswordParams params) async{
    // TODO: implement call
    return await repository.changePassword(params.code, params.password , params.username);
  }

}
class ChangePasswordParams extends Equatable{
  final code;
  final password;
  final username;

  ChangePasswordParams({@required this.code,@required this.password,@required this.username});

  @override
  // TODO: implement props
  List<Object> get props => [code,password,username];
}