import 'package:flutter/material.dart';
import 'package:graduation_project/Main_Screen/main_screen.dart';
import 'package:graduation_project/Theme/theme.dart';

class SignInScreen extends StatelessWidget {
  static const String routName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(MainScreen.routName);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.blackColor,
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Sign in",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/sign.png")
        ],
      ),
    );
  }
}
