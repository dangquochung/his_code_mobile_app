import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<dynamic> buildPageWithTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
