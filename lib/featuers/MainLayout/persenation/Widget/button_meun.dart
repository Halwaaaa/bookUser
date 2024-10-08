import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:user/core/constant/config.dart';

class Boutton_meun extends StatelessWidget {
  const Boutton_meun({
    super.key,
    required this.prees,
    required this.Artboard,
  });
  final VoidCallback prees;
  final ValueChanged Artboard;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: prees,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 4),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: Config().PrimerColor,
                  offset: const Offset(0, 2),
                  blurRadius: 8)
            ]),
            child: RiveAnimation.asset(
              "Assest/Rive/menu_button.riv",
              onInit: Artboard,
            ),
          ),
        ),
      ),
    );
  }
}
