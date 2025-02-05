import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';
import 'package:graduation_project/domain/use_case/get_all_categories_usecase.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
  HomeTabViewModel({required this.getAllCategoriesUseCase}):super(HomeTabInitialStates());


List<DataEntity>? categoriesList ;
  void getCategories()async{
    emit(HomeTabCategoryLoadingStates());
    var either = await getAllCategoriesUseCase.invoke();
    return either.fold((l) {
      emit(HomeTabCategoryErrorStates(errorMessage: l.errorMessage));
    }, (response) {
      categoriesList = response.data ?? [] ;
      emit(HomeTabCategorySuccessStates(categoryEntity: response));
    });
  }
}