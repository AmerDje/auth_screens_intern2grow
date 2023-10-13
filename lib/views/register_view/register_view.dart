import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/login_view/widgets/authentication_footer.dart';
import 'package:auth_screens_intern2grow/views/login_view/widgets/authentication_header.dart';
import 'package:flutter/material.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_button.dart';
import 'package:auth_screens_intern2grow/core/customs/custom_text_field.dart';

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
                  debugPrint("Have a Problem Tapped");
                },
                child: const Text("Have a Problem",
                    style: TextStyle(
                        decorationColor: Colors.blue,
                        decorationThickness: 2,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const AuthenticationHead(
            imageProfileUrl: Assets.authScreenHeader,
            viewTitle: "Create new account",
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
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
      ),
    ));
  }
}
