import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/common/authentication_footer.dart';
import 'package:auth_screens_intern2grow/views/common/authentication_header.dart';
import 'package:auth_screens_intern2grow/views/register_view/widgets/register_view_form.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const AuthenticationHead(
          imageProfileUrl: Assets.intern2GrowLogo,
          viewTitle: "Create new account",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterViewForm(),
              SizedBox(
                height: SizeConfig.blockH * 5,
              ),
              AuthenticationFooter(
                message: "Already have an account  ",
                navName: "Login",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
