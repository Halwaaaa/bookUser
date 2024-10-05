import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:user/shard/commponted/item/itemdate.dart';

class MyAcceptDates extends StatelessWidget {
  const MyAcceptDates({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Date Liner is here
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DatePicker(
              height: 90,
              DateTime.now(),
              // initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              daysCount: 30,
              onDateChange: (date) {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const ItemDate(canceld: false),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
