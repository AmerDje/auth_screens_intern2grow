import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int maxLines;
  final String text;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? initialValue;
  final Widget? suffix;
  final bool? readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final AutovalidateMode?
      autovalidateMode; //if you want only one fields to be validated
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.onSaved,
      this.obscureText = false,
      this.initialValue,
      this.suffix,
      this.readOnly,
      this.onTap,
      this.validator,
      this.focusNode,
      this.onTapOutside,
      this.autovalidateMode,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      onTap: onTap,
      initialValue: initialValue,
      onSaved: onSaved,
      maxLines: maxLines,
      onTapOutside: onTapOutside,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      validator: validator,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          suffixIcon: suffix,
          hintText: text,
          border: buildBorder(Colors.blue),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.grey),
        borderRadius: BorderRadius.circular(8));
  }
}
