import 'package:flutter/material.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/home_screen/home.dart';
import 'package:graduation_project/ui/home_screen/home_screen.dart';

class Notifications extends StatelessWidget {
  static const String routName = 'notifications' ;
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign in",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
