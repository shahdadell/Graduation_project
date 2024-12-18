import 'package:flutter/material.dart';
import 'package:graduation_project/Main_Screen/main_screen.dart';

class SignInScreen extends StatelessWidget {
  static const String routName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MainScreen.routName);
          },
        ),
      ),
      body: Center(
        child: Text(
          "SignInScreen",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
