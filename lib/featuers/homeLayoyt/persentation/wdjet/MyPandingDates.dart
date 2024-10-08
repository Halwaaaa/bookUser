import 'package:flutter/material.dart';
import 'package:user/featuers/homeLayoyt/persentation/wdjet/itemdate.dart';

class MyPandingDates extends StatelessWidget {
  const MyPandingDates({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: ((context, index) {
            return const ItemDate(
              canceld: false,
            );
          })),
    );
  }
}
