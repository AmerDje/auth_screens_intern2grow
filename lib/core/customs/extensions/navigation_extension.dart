import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  go(Widget widget, [RouteSettings? settings]) {
    Navigator.push(this, PageTransitionAnimation(widget: widget));
  }
}

class PageTransitionAnimation extends PageRouteBuilder {
  final Widget widget;
  PageTransitionAnimation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeIn);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            });
}
