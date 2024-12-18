import 'package:flutter/material.dart';
import 'package:graduation_project/App_Images/app_images.dart';
import 'package:graduation_project/Main_Screen/main_screen.dart';
import 'package:graduation_project/Theme/theme.dart';
import 'package:graduation_project/sign_up_screen/text_filed_siginup.dart';
import 'package:graduation_project/sing_in_screen/text_filed_login.dart';

class SignUpScreen extends StatefulWidget {
  static const String routName = 'SignUpScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Sign up",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppImages.sign,
                  width: 170,
                  height: 170,
                ),
                const SizedBox(height: 20),
                Text(
                  "Email Address",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                TextFiledSingup(
                  text: 'User name / Email',
                  type: TextInputType.emailAddress,
                  action: TextInputAction.done,
                  icon: Icons.email,
                  hint: 'Enter Your User Name',
                  controller: emailController,
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
                const SizedBox(height: 10),
                Text(
                  "User Name",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                TextFiledSingup(
                  controller: nameController,
                  text: 'User Name',
                  icon: Icons.person,
                  hint: 'Enter Your User Name',
                  type: TextInputType.name,
                  action: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "User Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Phone Number",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                TextFiledSingup(
                  controller: phoneController,
                  text: 'Phone Number',
                  icon: Icons.phone,
                  hint: 'Enter Your Phone Number',
                  type: TextInputType.phone,
                  action: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number is required";
                    }
                    if (value.length < 11) {
                      return "Phone Number Should Be At Least 11 Chars";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                TextFiledSingup(
                  controller: passwordController,
                  text: 'Password',
                  icon: Icons.remove_red_eye,
                  hint: 'Enter Your Password',
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password Should Be At Least 6 Chars";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
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
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    SignUp();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(11),
                    backgroundColor: MyTheme.orangeColor,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Register",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      child: Image.asset(
                        "assets/images/Separator2.png",
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
                        width: 38,
                        height: 38,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.facebook,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/ButtonApple.png",
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void SignUp() {
    if (formKey.currentState?.validate() == true) {}
  }
}
