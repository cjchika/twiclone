import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twiclone/apis/auth_api.dart';

class AuthController extends StateNotifier<bool> {
  AuthController({required AuthAPI authAPI}) : _authAPI = authAPI, super(false);

  final AuthAPI _authAPI;

  void signUp(
      {required String email,
      required String password,
      required BuildContext context,}) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    res.fold((l) => null, (r) => print(r.email));

  }
}








