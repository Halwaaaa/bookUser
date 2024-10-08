import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:user/core/constant/config.dart';

AwesomeDialog DafultAwssomeDialog(
  BuildContext context, {
  String? title,
  bool labelOk = false,
  String? labelTitle,
  required String massges,
  void Function()? btnOkOnPress,
}) {
  return AwesomeDialog(
      dialogBackgroundColor: Colors.white,
      barrierColor: const Color.fromRGBO(160, 160, 160, 0.41),
      context: context,
      title: title,
      titleTextStyle: const TextStyle(
        color: Color.fromRGBO(255, 0, 0, 1),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      btnOk: labelOk
          ? InkWell(
              onTap: btnOkOnPress,
              child: Chip(
                shape: const ContinuousRectangleBorder(),
                label: Text(
                  labelTitle ?? "",
                  style: const TextStyle(
                      color: Color.fromRGBO(140, 138, 140, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                backgroundColor: Config().colorTextDark2,
              ),
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Config().smallSpace(),
            Config().smallSpace(),
            Text(
              massges,
              textDirection: TextDirection.ltr,
              style: const TextStyle(color: Color.fromRGBO(140, 138, 140, 1)),
            ),
            Config().smallSpace(),
            Config().smallSpace(),
          ],
        ),
      ));
}
