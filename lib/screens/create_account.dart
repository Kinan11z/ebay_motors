import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/core/components/select_date.dart';
import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/screens/complete_create_account.dart';
import 'package:ebay_motors/screens/login.dart';
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
      home: CreateAccount(),
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // Width and length of screen
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    // TextField controller
    TextEditingController fullName = TextEditingController();
    TextEditingController birthday = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController passwordConfig = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(
            'Create your account',
            style: TextStyle(
                color: MyColors().grey,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Image.asset(flower),
              ),
              Container(
                width: width * 0.2,
                height: 2,
                color: MyColors().yellow,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height: width * 0.1,
                width: width * 0.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: MyColors().yellow),
                child: SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: MyColors().grey),
                    ),
                  ),
                ),
              ),
              Container(
                width: width * 0.1,
                height: 2,
                color: MyColors().yellow,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height: width * 0.05,
                width: width * 0.05,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: MyColors().yellow),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyColors().grey),
                  ),
                ),
              ),
              Container(
                width: width * 0.2,
                height: 2,
                color: MyColors().yellow,
              ),
              Image.asset(car)
            ],
          ),
          //********************************************
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 0.9,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Full name*',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: myFormField(
                      controller: fullName,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
                        } else {
                          return null;
                        }
                      },
                      label: '',
                    ),
                  ),
                  //*************************************** */
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Birthday',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: myFormField(
                        controller: birthday,
                        type: TextInputType.datetime,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your birthday';
                          } else {
                            return null;
                          }
                        },
                        label: '',
                        readOnly: true,
                        suffix: IconButton(
                            onPressed: () {
                              selectData(context, birthday);
                            },
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              color: MyColors().grey,
                            ))),
                  ),
                  //*************************************** */
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Email*',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
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
                      label: '',
                    ),
                  ),
                  //*************************************** */
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Password*',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: GetBuilder<PasswordController>(
                        init: PasswordController(),
                        builder: (controller) {
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
                            suffix: IconButton(
                              onPressed: () {
                                print(controller.isPassword);
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
                  //*************************************** */
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Confirm password*',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: GetBuilder<PasswordController>(
                        init: PasswordController(),
                        builder: (controller) {
                          return myFormField(
                            controller: passwordConfig,
                            type: TextInputType.visiblePassword,
                            isPassword: controller.isPassword,
                            validate: (value) {
                              if (password.text != passwordConfig.text) {
                                return 'No match';
                              } else {
                                return null;
                              }
                            },
                            label: '',
                            suffix: IconButton(
                              onPressed: () {
                                print(controller.isPassword);
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
                    height: height * 0.04,
                  ),
                  Center(
                    child: myButton(
                        function: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Get.to(CompleteCreateAccount());
                          }
                        },
                        text: 'Next',
                        backgroundColor: MyColors().yellow,
                        width: width * 0.3,
                        height: height * 0.06),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
