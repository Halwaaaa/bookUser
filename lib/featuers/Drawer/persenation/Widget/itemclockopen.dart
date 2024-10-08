import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemopenClock extends StatelessWidget {
  const ItemopenClock(
      {super.key,
      required this.ontap,
      required this.valueboxWeek,
      required this.valueboxdaliy,
      required this.onchangedDaliy,
      required this.onchangedWeek});

  final void Function() ontap;
  final void Function(bool?)? onchangedDaliy;
  final void Function(bool?)? onchangedWeek;

  final bool valueboxdaliy;
  final bool valueboxWeek;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 20),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Column(
          children: [
            InkWell(
              onTap: ontap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: value,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.deleteLeft,
                          ),
                        ),
                        Text(
                          "حذف",
                          style: TextStyle(fontSize: value),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: value,
                  child: Checkbox(
                    value: valueboxdaliy,
                    onChanged: onchangedDaliy,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "يومي",
                  style: TextStyle(fontSize: value),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: value,
                  child:
                      Checkbox(value: valueboxWeek, onChanged: onchangedWeek),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "اسبوعي",
                  style: TextStyle(fontSize: value),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
