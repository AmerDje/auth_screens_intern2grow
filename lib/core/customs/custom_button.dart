import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.maxFinite,
            0,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockH * 12,
              vertical: SizeConfig.blockV * 3.3)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.safeBV * 2.3,
        ),
      ),
    );
  }
}
