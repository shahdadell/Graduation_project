import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_case/register_use_case.dart';
import 'package:graduation_project/ui/sign_up_screen/cubit/register_state.dart';

class RegisterScreenViewmodel extends Cubit<RegisterState> {
  RegisterScreenViewmodel({required this.registerUseCase})
      : super(RegisterInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterUseCase registerUseCase ;
  bool? value = false;
  var formKey = GlobalKey<FormState>();
  void SignUp(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState(loadingMassage: "Loading..."));
        var response = await registerUseCase.invoke(
            userNameController.text,
            passwordController.text,
            emailController.text,
            phoneController.text);
        if (response.status == 'failure') {
          emit(
            RegisterErrorState(errorMessage: response.message),
          );
        } else {
          emit(
            RegisterSuccessState(response: response),
          );
        }
      } catch (e) {
        emit(
          RegisterErrorState(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
