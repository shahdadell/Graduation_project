import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_screen_state.dart';
import 'homewidgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'HomeScreen';
  HomeScreen({super.key});
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: bottomNavigationBar(
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
               viewModel.changeBottomNavigationIndex(index);
              },
              context: context),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
      bloc: viewModel,
    );

  }
}
