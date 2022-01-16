import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/loginController.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 60.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                  child: Text("Hello\nWelcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      labelText: "USER NAME",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    controller: controller.userNameController,
                    onSaved: (value){
                      controller.userName = value!;
                    },
                    validator: (value){return controller.validateField(value!);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 40),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    controller: controller.passwordController,
                    onSaved: (value){
                      controller.password = value!;
                    },
                    validator: (value){return controller.validateField(value!);},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                        onPressed: ()async{
                          if(await controller.checkLogin()){
                            Get.toNamed('/home');
                          }
                          else{
                            Get.snackbar("Error", "username or password is wrong");
                          }
                        },
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
