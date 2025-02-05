import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/login_use_case.dart';
import 'package:graduation_project/ui/sing_in_screen/cuibt/login_state.dart';

class LoginScreenViewmodel extends Cubit<LoginState> {
  LoginScreenViewmodel({required this.loginUseCase})
      : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginUseCase loginUseCase;
  bool? value = false;
  var formKey = GlobalKey<FormState>();

  void SignIn(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {

      emit(LoginLoadingState(loadingMassage: "Loading..."));
      var either = await loginUseCase.invoke(
          passwordController.text, emailController.text );
      either.fold((l){
        emit(LoginErrorState(errorMessage: l.errorMessage));
      },
          (response) {
            emit(LoginSuccessState(response: response));
          });
    }
  }
}
