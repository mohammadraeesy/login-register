import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_register/core/error/failures.dart';
import 'package:login_register/features/register/domain/use_cases/register_usecase.dart';


part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase register;

  RegisterBloc({@required this.register})
      : assert(register != null),
        super(Empty());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is clickButtonPress) {
      yield Loading();
      await Future.delayed(Duration(seconds: 5));
      final Either<Failure, bool> failureOrRegister =
          await register(Params(
              username: event.username,
              password: event.password,
              firstname: event.firstname,
              lastname: event.lastname,
              phonenumber: event.phonenumber,
              email: event.email));
      yield failureOrRegister.fold(
        (failure) => Error(message: 'ERROR'),
        (respons) {
          if (respons) {
            return Loaded(massage: 'successfully Register');
          } else {
            return Error(message: 'Error');
          }
        },
      );
    } else {
      yield Error(message: 'ERROR');
    }
  }
}
