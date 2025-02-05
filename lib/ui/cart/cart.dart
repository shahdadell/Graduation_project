import 'package:flutter/material.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/home_screen/home.dart';
import 'package:graduation_project/ui/home_screen/home_screen.dart';

class Cart extends StatelessWidget {
  static const String routName = 'cart' ;

  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
