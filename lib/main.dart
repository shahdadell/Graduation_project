import 'package:flutter/material.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/home_screen/home_screen.dart';
import 'package:graduation_project/ui/main_screen/main_screen.dart';
import 'package:graduation_project/ui/otp/otp_screen.dart';
import 'package:graduation_project/ui/sign_up_screen/sign_up_screen.dart';
import 'package:graduation_project/ui/sing_in_screen/sign_in_screen.dart';
import 'package:graduation_project/ui/splash_screen/splash_screen.dart';

import 'data/model/category_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: CategoryDetails.routName,
      routes: {
        SplashScreen.routName : (context) => const SplashScreen(),
        HomeScreen.routName : (context) => const HomeScreen(),
        MainScreen.routName : (context) => const MainScreen(),
        SignInScreen.routName : (context) => SignInScreen(),
        SignUpScreen.routName : (context) => const SignUpScreen(),
        OtpScreen.routName : (context) =>  OtpScreen(),
        CategoryDetails.routName: (context) => CategoryDetails(),

      },
    );
  }
}

