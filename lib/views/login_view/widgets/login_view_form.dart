import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
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
  TextEditingController emailController = TextEditingController();
  String? password;
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
            controller: emailController,
            onTap: () {
              isTapped = true;
              setState(() {});
            },
            text: "example@gmail.com",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StatefulBuilder(builder: (context, setState) {
                return SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox.adaptive(
                    // materialTapTargetSize:
                    //     MaterialTapTargetSize.shrinkWrap,
                    value: isRemembered,
                    onChanged: (value) {
                      isRemembered = value!;
                      isRemembered != isRemembered;
                      setState(() {});
                    },
                  ),
                );
              }),
              const Text("  Remember me",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              InkWell(
                onTap: () {
                  debugPrint("Forget Password Tapped");
                },
                child: const Text("Forget Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockH * 5,
          ),
          CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  debugPrint(emailController.text);
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
