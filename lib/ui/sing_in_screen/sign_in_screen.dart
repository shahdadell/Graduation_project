import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/App_Images/app_images.dart';
import 'package:graduation_project/domain/di.dart';
import 'package:graduation_project/ui/Theme/dialog_utils.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/forget_password/forget_password.dart';
import 'package:graduation_project/ui/main_screen/main_screen.dart';
import 'package:graduation_project/ui/otp/otp_screen.dart';
import 'package:graduation_project/ui/sing_in_screen/text_filed_login.dart';
import 'cuibt/login_screen_viewmodel.dart';
import 'cuibt/login_state.dart';

class SignInScreen extends StatefulWidget {
  static const String routName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginScreenViewmodel viewmodel = LoginScreenViewmodel(
    loginUseCase: injectLoginUseCase(),
  );
  @override
  void dispose() {
    super.dispose();
    viewmodel.emailController.dispose();
    viewmodel.passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    viewmodel.emailController = TextEditingController();
    viewmodel.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewmodel, LoginState>(
      bloc: viewmodel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMassage!);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.response.registerResponseEntity?.message ?? '',
              posActionName: 'Ok', posAction: () {
            Navigator.of(context).pushReplacementNamed(
              OtpScreen.routName,
              arguments: viewmodel.emailController.text,
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainScreen.routName);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.arrow_back_ios,
                color: MyTheme.blackColor,
                size: 30,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Sign in",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Form(
          key: viewmodel.formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppImages.sign),
                  const SizedBox(height: 40),
                  Text(
                    "Email Address",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFiledLogin(
                    text: 'Email',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.done,
                    icon: Icons.email,
                    controller: viewmodel.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "E-mail is required";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'PLease Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFiledLogin(
                    isObsecure: true,
                    password: true,
                    text: 'Password',
                    type: TextInputType.visiblePassword,
                    action: TextInputAction.done,
                    icon: Icons.remove_red_eye,
                    controller: viewmodel.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value != viewmodel.passwordController.value) {
                        return "Password Doesn't Match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showForgetPasswordBottomSheet();
                        },
                        child: const Text(
                          "Forget Password ?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Color(0xffF87146),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      viewmodel.SignIn;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(11),
                      backgroundColor: MyTheme.orangeColor,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Sign in",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 350,
                        child: Image.asset(
                          "assets/images/Separator.png",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.google,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppImages.facebook,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/ButtonApple.png",
                          width: 33,
                          height: 33,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showForgetPasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ForgetPassword(),
    );
  }
}
