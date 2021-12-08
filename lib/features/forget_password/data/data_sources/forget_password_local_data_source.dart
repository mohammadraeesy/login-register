
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/core/error/exceptions.dart';
import 'package:login_register/features/forget_password/data/models/change_password_forget_password_model.dart';
import 'package:login_register/features/forget_password/data/models/send_recovery_code_forget_password_model.dart';

abstract class ForgetPasswordRemoteDataSources {
  Future<bool> changePassword(ChangePasswordModel modelChangePassword);

  Future<bool> sendRecoveryCode(SendRecoveryCodeModel modelSendRecoveryCode);
}

class ForgetPasswordRemoteDataSourcesImpl
    implements ForgetPasswordRemoteDataSources {
  final http.Client client;

  ForgetPasswordRemoteDataSourcesImpl({@required this.client});

  @override
  Future<bool> changePassword(ChangePasswordModel modelChangePassword) async {
    try {
      final String url = 'http://192.168.43.10:8762/auth/signin';
      // final response = await client.post(
      //   url,
      // body: json.encode(modelChangePassword.toJson()),
      // headers: {
      //   'Content-Type': 'application/json; charset=utf-8'
      // }).timeout(Duration(seconds: 6));

      if (true) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<bool> sendRecoveryCode(
      SendRecoveryCodeModel modelSendRecoveryCode) async {
    // TODO: implement sendEmail
    try {
      // final String url = 'http://192.168.43.10:8762/auth/signin';
      // final response = await client.post(
      //     url,
      // body: json.encode(modelSendRecoveryCode.toJson()),
      // headers: {
      //   'Content-Type': 'application/json; charset=utf-8'
      // }).timeout(Duration(seconds: 6));

      if (true) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }
}
