import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:login/models/accessTokenModel.dart';
import 'package:login/services/authService.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController, passwordController;
  AccessToken? accessToken = null.obs();

  var userName = "";
  var password = '';
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  String? validateField(String value) {
    if (value.length < 6) {
      return "Must containts at least 6 characters";
    }
    return null;
  }

  Future<bool> fetchAccessToken() async {
    accessToken = await AuthService.fetchAccessToken(userName, password);

    if(accessToken!=null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkLogin() async{
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return false;
    loginFormKey.currentState!.save();
    return await fetchAccessToken();
  }
}
