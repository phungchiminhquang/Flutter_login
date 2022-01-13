import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController,passwordController;

  var userName ="";
  var password= '';
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

  String? validateField(String value){
    if(value.length <6){
      return "Must containts at least 6 characters";
    }
    return null;
  }
  bool checkLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid) return false;
    loginFormKey.currentState!.save();
    return true;
  }
}