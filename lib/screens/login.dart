import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/components/clip_rectangle.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/main.dart';
import 'package:ebay_motors/screens/convex_appbar_home.dart';
import 'package:ebay_motors/screens/create_account.dart';
import 'package:ebay_motors/state_management/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // injection controller
  PasswordController controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    // Width and length of screen
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    // init TextField controller
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  child: Image.asset(
                    login,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        'Ebay motors ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            height: 54.0 / 45.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Text(
                        'Driving you to your \ndream car!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            height: 36.0 / 31.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child:
                // Form for TextField
                Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  // TextField for Email
                  SizedBox(
                    width: width * 0.8,
                    child: myFormField(
                        controller: email,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          String emailFormat =
                              r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                          RegExp regExp = new RegExp(emailFormat);
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!regExp.hasMatch(value)) {
                            return 'This is not an email';
                          } else {
                            return null;
                          }
                        },
                        label: ''),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  // TextField for password
                  SizedBox(
                    width: width * 0.8,
                    child:
                        GetBuilder<PasswordController>(builder: (controller) {
                      return myFormField(
                        controller: password,
                        type: TextInputType.visiblePassword,
                        isPassword: controller.isPassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          } else {
                            return null;
                          }
                        },
                        label: '',
                        // password visibility
                        suffix: IconButton(
                          onPressed: () {
                            controller.visibilityPassword();
                          },
                          icon: controller.isPassword
                              ? Icon(
                                  Icons.visibility_off,
                                  color: MyColors().grey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: MyColors().grey,
                                ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  myButton(
                      function: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Get.to(AccountDetails());
                        }
                      },
                      text: 'Login',
                      height: height * 0.05,
                      width: width * 0.3,
                      backgroundColor: MyColors().yellow),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Forget password?',
                    style: TextStyle(color: MyColors().yellow, fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "don't you have account?",
                    style: TextStyle(color: MyColors().grey, fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(CreateAccount());
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: MyColors().yellow, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
