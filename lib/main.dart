import 'package:ebay_motors/core/components/clip_rectangle.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/main.dart';
import 'package:ebay_motors/screens/convex_appbar_home.dart';
import 'package:ebay_motors/screens/create_account.dart';
import 'package:ebay_motors/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
