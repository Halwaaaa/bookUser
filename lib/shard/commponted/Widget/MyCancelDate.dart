import 'package:flutter/material.dart';
import 'package:user/shard/commponted/item/itemdate.dart';

class MyCancelDate extends StatelessWidget {
  const MyCancelDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const ItemDate(
          canceld: true,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: 10,
      ),
    );
  }
}
