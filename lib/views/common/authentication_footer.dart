import 'package:flutter/material.dart';

class AuthenticationFooter extends StatelessWidget {
  const AuthenticationFooter({
    super.key,
    required this.message,
    required this.navName,
    required this.onTap,
  });
  final String message;
  final String navName;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message),
        InkWell(
          onTap: onTap,
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
