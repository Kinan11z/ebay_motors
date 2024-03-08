import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/screens/car_details.dart';
import 'package:ebay_motors/screens/cart.dart';
import 'package:ebay_motors/screens/filter_page.dart';
import 'package:ebay_motors/screens/home.dart';
import 'package:ebay_motors/state_management/navigate_controller.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountDetails(),
    );
  }
}

const List<String> _iconImage = [iconSetting, iconHome, iconCart];
const _kPages = <String, IconData>{
  'home': Icons.home,
  'map': Icons.map,
  'add': Icons.add,
};

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<NavigateController>(
                  init: NavigateController(),
                  builder: (controller) {
                    return TabBarView(
                      children: [Container(), HomeRoute(), CartPage()],
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: MyColors().yellow,
          activeColor: MyColors().yellow,
          items: <TabItem>[
            for (final entry in _iconImage) TabItem(icon: Image.asset(entry)),
          ],
        ),
      ),
    );
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigateController>(
        init: NavigateController(),
        builder: (controller) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (controller.navToDetails) {
                return CarDetails();
              } else if (controller.navToFilter) {
                return FilterPage();
              } else {
                return HomePage();
              }
            },
          );
        });
  }
}
