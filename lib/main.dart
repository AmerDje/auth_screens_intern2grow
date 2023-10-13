import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:auth_screens_intern2grow/views/login_view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AuthScreensInterToGrow());
}

class AuthScreensInterToGrow extends StatelessWidget {
  const AuthScreensInterToGrow({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const MaterialApp(
      home: LoginView(),
    );
  }
}
