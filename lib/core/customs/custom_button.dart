import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blue});
  final String text;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.maxFinite,
            20,
          ),
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockV * 2)),
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
