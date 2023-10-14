import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileViewForm extends StatelessWidget {
  const ProfileViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel(
        username: "ahmed0saber",
        email: "ahmed0saber@gmail.com",
        gender: "Male");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Text("Username"),
        ),
        CustomTextField(
          initialValue: user.username,
          readOnly: true,
        ),
        SizedBox(
          height: SizeConfig.blockH * 5,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Text("Email"),
        ),
        CustomTextField(
          initialValue: user.email,
          readOnly: true,
        ),
        SizedBox(
          height: SizeConfig.blockH * 5,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Text("Gender"),
        ),
        CustomTextField(
          initialValue: user.gender,
          readOnly: true,
        ),
        SizedBox(
          height: SizeConfig.blockH * 5,
        ),
        CustomButton(
          onPressed: () {
            debugPrint("logout button pressed");
            Navigator.pop(context);
          },
          text: "Logout",
          color: Colors.red,
        ),
      ],
    );
  }
}
