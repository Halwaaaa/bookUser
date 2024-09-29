import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class page extends PageRouteBuilder {
  page({required this.pagee})
      : super(
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => pagee,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  // ignore: empty_constructor_bodies
  Widget pagee;
}
