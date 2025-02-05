import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/cart/cart.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_screen_state.dart';
import 'package:graduation_project/ui/home_screen/tabs/home.dart';
import 'package:graduation_project/ui/notifications/notifications.dart';


class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    Home(),
    Notifications(),
    Cart()
  ];
  void changeBottomNavigationIndex(int newSelectedIndex){

    selectedIndex = newSelectedIndex ;
    emit(HomeChangeBottomNavigationBar());

  }
}