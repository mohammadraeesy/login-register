import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:login_register/features/authentication/data/models/authentication_model.dart';
import 'package:login_register/features/authentication/domain/entities/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationDataSources {
  Future<void> addAuthentication(AuthenticationModel authenToCash);

  Future<bool> deleteToken();

  Future<AuthenticationEntity> findToken();

  Future<bool> checkToken();
}

const CASHED_AUTHENTICATION = 'CASHED_AUTHENTICATION';

class AuthenticationDataSourcesImpl implements AuthenticationDataSources {
  final SharedPreferences sharedPreferences;

  AuthenticationDataSourcesImpl({@required this.sharedPreferences});

  @override
  Future<bool> deleteToken() {
    sharedPreferences.remove(CASHED_AUTHENTICATION);
    return Future.value(true);
  }

  @override
  Future<AuthenticationEntity> findToken() {
    final jsonAuthentication =
        sharedPreferences.getString(CASHED_AUTHENTICATION);
    return Future.value(
        AuthenticationModel.fromJson(json.decode(jsonAuthentication)));
    // if (token != null && token.isNotEmpty) {
    //   return Future.value(token);
    // } else {
    //   return CacheFailureToken();
    // }
  }

  @override
  Future<bool> checkToken() {
    final jsonAuthentication =
        sharedPreferences.getString(CASHED_AUTHENTICATION);
    // return Future.value(
    //     AuthenticationModel.fromJson(json.decode(jsonAuthentication)).token);
    if (jsonAuthentication != null ) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<void> addAuthentication(AuthenticationModel authenToCash) {
    return sharedPreferences.setString(
        CASHED_AUTHENTICATION, json.encode(authenToCash.toJson()));
  }
}
