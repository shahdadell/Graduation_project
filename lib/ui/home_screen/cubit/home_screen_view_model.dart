import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_stste.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel():super(HomeInitialState());

}