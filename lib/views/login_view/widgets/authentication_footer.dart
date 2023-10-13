import 'package:auth_screens_intern2grow/core/customs/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';

class AuthenticationFooter extends StatelessWidget {
  const AuthenticationFooter({
    super.key,
    required this.message,
    required this.navName,
  });
  final String message;
  final String navName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message),
        InkWell(
          onTap: () {
            context.go(const Scaffold());
          },
          child: Text(
            navName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
