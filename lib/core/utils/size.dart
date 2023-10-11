import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData? _mediaQueryData;
  static late double screenW;
  static late double screenH; //we use this with the widgets
  static late double blockH;
  static late double blockV;

  static late double _safeAH;
  static late double _safeAV; //we use this with the texts
  static late double safeBH;
  static late double safeBV;
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW / 100;
    blockV = screenH / 100;

    _safeAH = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAV = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBH = (screenW - _safeAH) / 100;
    safeBV = (screenH - _safeAV) / 100;
  }
}
