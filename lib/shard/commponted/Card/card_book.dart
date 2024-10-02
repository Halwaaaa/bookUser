// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types, must_be_immutable
class card_book extends StatelessWidget {
  card_book(
      {super.key,
      required this.Card_name,
      required this.Card_data,
      required this.Card,
      required this.boby,
      required this.icon,
      required this.isone});
  final String Card_name;
  final String Card_data;
  final VoidCallback Card;
  final Color boby;
  final Color icon;
  bool isone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Card,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: boby,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black87, spreadRadius: 2, blurRadius: 4)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: icon, shape: BoxShape.circle),
              child:
                  // ignore: deprecated_member_use
                  FaIcon(isone
                      ? FontAwesomeIcons.add
                      : FontAwesomeIcons.mapLocation),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Card_name,
              style: TextStyle(
                  color: isone ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              Card_data,
              style: TextStyle(
                  color: isone ? Colors.white : Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
