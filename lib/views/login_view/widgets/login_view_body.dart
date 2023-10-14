import 'package:auth_screens_intern2grow/core/extensions/navigation_extension.dart';
import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/common/authentication_footer.dart';
import 'package:auth_screens_intern2grow/views/common/authentication_header.dart';
import 'package:auth_screens_intern2grow/views/login_view/widgets/login_view_form.dart';
import 'package:auth_screens_intern2grow/views/register_view/register_view.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const AuthenticationHead(
          imageProfileUrl: Assets.intern2GrowLogo,
          viewTitle: "Log in to your account",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginViewForm(),
              SizedBox(
                height: SizeConfig.blockH * 5,
              ),
              AuthenticationFooter(
                message: "Don't have an account  ",
                navName: "Register",
                onTap: () {
                  context.go(const RegisterView());
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
