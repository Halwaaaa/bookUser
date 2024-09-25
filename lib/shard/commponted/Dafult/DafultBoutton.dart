import 'package:flutter/material.dart';
import 'package:user/shard/constant/config.dart';

class Boutton extends StatelessWidget {
  Boutton(
      {super.key,
      required this.hieght,
      required this.wdith,
      required this.titil,
      this.size,
      this.fillColor,
      this.ontap,
      this.textColor,
      required this.isLoding});

  final double hieght;
  final double wdith;
  final String titil;
  double? size;
  Color? fillColor;
  Color? textColor;
  final bool isLoding;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isLoding ? ontap : null,
      child: Container(
        height: hieght,
        width: wdith,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: fillColor ?? Config().PrimerColor),
        child: Center(
          child: FittedBox(
            child: !isLoding
                ? Text(
                    titil,
                    maxLines: 1,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: size ?? 16,
                        fontWeight: FontWeight.w900),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
