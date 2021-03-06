import 'package:flutter/cupertino.dart';
import 'package:login_register/features/activation/domain/entities/activation_entity.dart';


class ActivationModel extends ActivationEntity{
  final String code;
  final String username;

  ActivationModel({@required this.code, @required this.username});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'username': username,
    };
  }
}
