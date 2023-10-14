import 'package:auth_screens_intern2grow/core/utils/assets.dart';
import 'package:auth_screens_intern2grow/core/utils/size.dart';
import 'package:flutter/material.dart';

class AuthenticationHead extends StatelessWidget {
  const AuthenticationHead(
      {super.key, required this.imageProfileUrl, required this.viewTitle});
  final String imageProfileUrl;
  final String viewTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenH / 4,
          width: SizeConfig.screenW,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.authScreenHeader,
                fit: BoxFit.fill,
              ),
              Positioned(
                right: SizeConfig.screenW / 2 - 58,
                top: SizeConfig.screenH / 4 - 58,
                child: Image.asset(
                  imageProfileUrl,
                  height: 116,
                  width: 116,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenH / 10,
        ),
        Text(
          viewTitle,
          style: const TextStyle(
              fontSize: 23, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
