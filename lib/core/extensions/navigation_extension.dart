import 'package:auth_screens_intern2grow/core/utils/page_transition.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  go(Widget widget, [RouteSettings? settings]) {
    Navigator.push(this, PageTransitionAnimation(widget: widget));
  }
}
