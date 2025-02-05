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
  RegisterUseCase registerUseCase;
  bool? value = false;
  var formKey = GlobalKey<FormState>();
  void SignUp(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState(loadingMassage: "Loading..."));
      var either = await registerUseCase.invoke(userNameController.text,
          passwordController.text, emailController.text, phoneController.text);
      either.fold((l){
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      },
          (response) {
            emit(RegisterSuccessState(response: response));
          });
    }
  }
}
