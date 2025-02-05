import 'package:flutter/material.dart';
import 'package:graduation_project/ui/cart/cart.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_screen_view_model.dart';
import '../notifications/notifications.dart';
import 'home.dart';
import 'homewidgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    Notifications(),
    Home(),
    Cart()
  ];
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(
          selectedIndex: selectedIndex,
          onTapFunction: (index) {
            selectedIndex = index;
            setState(() {});
          },
          context: context),
      body: tabs[selectedIndex],
    );
  }
}
