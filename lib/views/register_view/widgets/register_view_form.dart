import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/common/remember_me_line.dart';
import 'package:flutter/material.dart';

class RegisterViewForm extends StatefulWidget {
  const RegisterViewForm({super.key});

  @override
  State<RegisterViewForm> createState() => _RegisterViewFormState();
}

class _RegisterViewFormState extends State<RegisterViewForm> {
  bool isRemembered = false;
  bool isTapped = false;
  bool isHidden = true;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? password;
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
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
                : const Icon(Icons.person_outline),
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Text("email"),
          ),
          CustomTextField(
            controller: emailController,
            onTap: () {
              isTapped = true;
              setState(() {});
            },
            text: "example@gmail.com",
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Field can't empty";
              } else if (!emailValid.hasMatch(value!)) {
                return "Please type a valid name";
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
                      emailController.text = '';
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
            text: "Have a problem ?",
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  debugPrint(usernameController.text);
                  debugPrint(emailController.text);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Register"),
        ],
      ),
    );
  }
}
