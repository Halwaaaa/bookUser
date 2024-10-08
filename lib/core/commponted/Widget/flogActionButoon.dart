import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user/core/constant/config.dart';

Widget flogActionButoon({required var onpress}) {
  return GestureDetector(
    onTap: onpress,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            animationDuration: const Duration(seconds: 2),
            backgroundColor: Config().PrimerColor,
            disabledBackgroundColor: Colors.amber,
            disabledForegroundColor: Colors.amber),
        onPressed: onpress,
        // ignore: deprecated_member_use
        child: const Icon(FontAwesomeIcons.add)),
  );
}
