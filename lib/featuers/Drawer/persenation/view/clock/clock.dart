import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart' hide Intent;
import 'package:user/core/commponted/Widget/flogActionButoon.dart';
import 'package:user/core/constant/config.dart';
import 'package:user/core/servers/localNot.dart';
import 'package:user/featuers/Drawer/persenation/Widget/itemclock.dart';
import 'package:user/shard/cubit/Darwer.dart/cubitclock.dart';
import 'package:user/shard/cubit/Darwer.dart/statesclock.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> with TickerProviderStateMixin {
  // @override
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 150,
            leading: const Center(
              child: Text(
                "منبه دوائيٍٍ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(cubit.Time.length, (index) {
                  print(cubit.Time.length);

                  return ItemClock(
                    cubit: cubit,
                    index: index,
                  );
                }),
              ),
            ),
          ),
          floatingActionButton: flogActionButoon(onpress: () {
            showTimePicker(
                    cancelText: "الغاء",
                    confirmText: "اختيار",
                    hourLabelText: "",

                    //helpText: "موافق",
                    onEntryModeChanged: (p0) {
                      setState(() {});
                      print(p0);
                    },
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    context: context,
                    initialTime: TimeOfDay.now())
                .then((value) async {
              if (value != null) {
                // Time.add(value);
                cubit.insertDataBase(
                    daliy: 1,
                    open: 0,
                    Hour: value.hour,
                    min: value.minute,
                    name: "موعد الدواء",
                    status: "do");
              }
            });
          }),
        );
      },
      listener: (context, state) {
        if (state is AppgetDataBasestate) {
          //  print("vbnm,./");
        }
      },
    );
  }
}

show() {
  Noti()
      .showBigTextNotification(title: "منبه دوائي", body: "nموعد الدواء الان");
}
