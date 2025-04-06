import 'package:flutter/material.dart';

class AnimationRoute extends PageRouteBuilder {
  // ignore: prefer_typing_uninitialized_variables
  final page;
  AnimationRoute({this.page})
      : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, animation2) => page,
          transitionsBuilder: (context, animation, animation2, child) =>
              SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ),
            ),
          ),
        );
}
