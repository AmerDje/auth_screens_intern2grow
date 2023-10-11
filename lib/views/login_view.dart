import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isRemembered = false;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: SizeConfig.screenH / 4,
              width: SizeConfig.screenW,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.authScreenHeader,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    right: SizeConfig.screenW / 2 - 58,
                    top: SizeConfig.screenH / 4 - 58,
                    child: Image.asset(
                      Assets.intern2GrowLogo,
                      height: 116,
                      width: 116,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenH / 10,
            ),
            const Text(
              "Log in to your account",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("Username"),
                  ),
                  const CustomTextField(
                    text: "example@gamil.com",
                    suffixIcon: Icon(Icons.cancel_outlined),
                  ),
                  SizedBox(
                    height: SizeConfig.blockH * 6,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("Password"),
                  ),
                  const CustomTextField(
                    text: "*******",
                    suffixIcon: Icon(Icons.cancel_outlined),
                  ),
                  SizedBox(
                    height: SizeConfig.blockH * 6,
                  ),
                  Row(children: [
                    StatefulBuilder(builder: (context, setState) {
                      return Checkbox.adaptive(
                          value: isRemembered,
                          onChanged: (value) {
                            isRemembered = value!;
                            isRemembered != isRemembered;
                            setState(() {});
                          });
                    }),
                    const Text("  Remember me ?"),
                    const Spacer(),
                    const Text("Forget Password"),
                  ]),
                  SizedBox(
                    height: SizeConfig.blockH * 6,
                  ),
                  CustomButton(onPressed: () {}, text: "Login"),
                  SizedBox(
                    height: SizeConfig.blockH * 6,
                  ),
                  const Text("Don't have an account Register"),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
