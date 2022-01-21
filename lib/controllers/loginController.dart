import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:login/data/globalData.dart' as global_data;
import 'package:login/services/authService.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController, passwordController;

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
    global_data.accessToken = await AuthService.fetchAccessToken(userName, password);

    if(global_data.accessToken!=null) {
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
