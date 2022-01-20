import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/loginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Colors.indigo[900],
      child: ClipPath(
        clipper: BackgroudClipper(),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.loginFormKey,
          child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 130),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "QUAN TRẮC \nONLINE",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.bottomLeft,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Chào mừng trở lại',
                            textStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          TypewriterAnimatedText(
                            'Đăng nhập để tiếp tục',
                            textStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 150),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: controller.userNameController,
                      onSaved: (value) {
                        controller.userName = value!;
                      },
                      validator: (value) {
                        return controller.validateField(value!);
                      },
                      cursorColor: Colors.indigo,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.supervised_user_circle_rounded,
                          color: Colors.indigo,
                          size: 15,
                        ),
                        hintText: "Tên đăng nhập",
                        hintStyle: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 12,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffEEEEEE),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        return controller.validateField(value!);
                      },
                      cursorColor: Colors.indigo,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                        focusColor: Colors.indigo,
                        icon: Icon(
                          Icons.lock,
                          size: 15,
                          color: Colors.indigo,
                        ),
                        hintText: "Mật khẩu",
                        hintStyle: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 12,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here
                      },
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 12,
                        ),
                      ),
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
                            Get.toNamed('/navigation');
                          }
                          else{
                            Get.closeAllSnackbars();
                            Get.snackbar("Error", "username or password is wrong",isDismissible: true,);
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
              )),
        ),
      ),
    )));
  }
}

class BackgroudClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.25);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
