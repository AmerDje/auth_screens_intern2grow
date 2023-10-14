import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';
import 'package:auth_screens_intern2grow/core/extensions/navigation_extension.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/common/remember_me_line.dart';
import 'package:auth_screens_intern2grow/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  bool isRemembered = false;
  bool isTapped = false;
  bool isHidden = true;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  String? password;
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Text("Username"),
          ),
          CustomTextField(
            controller: usernameController,
            onTap: () {
              isTapped = true;
              setState(() {});
            },
            text: "example10",
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Field can't empty";
              }
              return null;
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
              isTapped = false;
              setState(() {});
            },
            suffix: isTapped == true
                ? IconButton(
                    onPressed: () {
                      usernameController.text = '';
                      setState(() {});
                    },
                    icon: const Icon(Icons.cancel_outlined))
                : const Icon(Icons.email_outlined),
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Text("Password"),
          ),
          CustomTextField(
            obscureText: isHidden,
            onTap: () {
              isTapped = false;
              setState(() {});
            },
            text: "••••••••",
            onSaved: (value) {
              password = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Field can't empty";
              }
              return null;
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();

              setState(() {});
            },
            suffix: IconButton(
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
                icon: isHidden == true
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined)),
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          RememberMeLine(
            isRemembered: isRemembered,
            onChanged: (value) {
              isRemembered = value!;
              isRemembered != isRemembered;
              setState(() {});
            },
            text: "Forget password ?",
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  debugPrint(usernameController.text);
                  context.go(const ProfileView());
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Login"),
        ],
      ),
    );
  }
}
