import 'package:flutter/material.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/otp/text_filed_otpScreen.dart';
import 'package:graduation_project/ui/sign_up_screen/sign_up_screen.dart';

class OtpScreen extends StatelessWidget {
  static const String routName = 'otp';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SignUpScreen.routName);
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
          "Enter Otp ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter The Confirmation code",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Verification code has been sent to your email",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(11),
                backgroundColor: MyTheme.orangeColor,
              ),
              child: Text(
                textAlign: TextAlign.center,
                "Continue",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
