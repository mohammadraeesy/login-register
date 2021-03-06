import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/core/usecases/usecases.dart';
import 'package:login_register/features/activation/domain/repositories/activation_repository.dart';


class SendCodeActivation extends UseCase<bool , ActivationCodeParams>{
  final ActivationRepository repository;

  SendCodeActivation(this.repository);

  @override
  Future<Either<Failure, bool>> call(ActivationCodeParams params) async{
    // TODO: implement call
    return await repository.sendCodeActivation(params.code,params.username);
  }
  
}
class ActivationCodeParams extends Equatable{
  final code;
  final username;


  ActivationCodeParams({@required this.code,@required this.username});

  @override
  // TODO: implement props
  List<Object> get props => [code];
  
  
} 