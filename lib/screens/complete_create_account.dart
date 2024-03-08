import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/core/components/select_date.dart';
import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/screens/convex_appbar_home.dart';
import 'package:ebay_motors/screens/login.dart';
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
      home: CompleteCreateAccount(),
    );
  }
}

// TextField controller
TextEditingController bankName = TextEditingController();
TextEditingController bankHolders = TextEditingController();
TextEditingController accountNumber = TextEditingController();
TextEditingController phoneNumber = TextEditingController();

class CompleteCreateAccount extends StatelessWidget {
  const CompleteCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: TopArea(
              height: height,
              width: width,
            ),
          ),
          //*************************************** */
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            flex: 9,
            child: SizedBox(
                width: width * 0.9,
                child: CenterArea(height: height, width: width)),
          ),
          //*************************************** */
          Expanded(
            flex: 1,
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.to(AccountDetails());
                },
                child: Text(
                  'Skip for now >',
                  style: TextStyle(fontSize: 20, color: MyColors().grey),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class TopArea extends StatelessWidget {
  TopArea({super.key, required this.width, required this.height});

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              height: width * 0.05,
              width: width * 0.05,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors().yellow),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 10,
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
            Container(
              height: width * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: MyColors().yellow),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                      fontSize: 20,
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
      ],
    );
  }
}

class CenterArea extends StatelessWidget {
  CenterArea({super.key, required this.height, required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.8,
          child: Text(
            'Bank name',
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
            controller: bankName,
            type: TextInputType.name,
            validate: (p0) {},
            label: '',
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            "Bank Holder's Name",
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
            controller: bankHolders,
            type: TextInputType.name,
            validate: (p0) {},
            label: '',
            readOnly: true,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            'Account number',
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
            controller: accountNumber,
            type: TextInputType.number,
            validate: (p0) {},
            label: '',
            readOnly: true,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            'Phone number',
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
            controller: phoneNumber,
            type: TextInputType.number,
            validate: (p0) {},
            label: '',
            readOnly: true,
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Center(
            child: myButton(
                function: () {
                  Get.to(AccountDetails());
                },
                text: 'Login',
                backgroundColor: MyColors().yellow,
                width: width * 0.3,
                height: height * 0.06)),
      ],
    );
  }
}
