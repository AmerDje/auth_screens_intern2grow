import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/views/common/authentication_header.dart';
import 'package:auth_screens_intern2grow/views/profile_view/widgets/profile_view_form.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        AuthenticationHead(
          imageProfileUrl: Assets.user,
          viewTitle: "Profile Information",
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileViewForm(),
            ],
          ),
        )
      ]),
    );
  }
}
