import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTabStates{}
class HomeTabInitialStates extends HomeTabStates{}
class HomeTabCategoryLoadingStates extends HomeTabStates{
  String? loadingMessage ;
  HomeTabCategoryLoadingStates({this.loadingMessage});
}
class HomeTabCategorySuccessStates extends HomeTabStates{
  CategoryResponseEntity categoryEntity ;
  HomeTabCategorySuccessStates({required this.categoryEntity});
}
class HomeTabCategoryErrorStates extends HomeTabStates{
  String? errorMessage ;
  HomeTabCategoryErrorStates({this.errorMessage});
}