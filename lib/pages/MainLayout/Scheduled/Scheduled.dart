// ignore_for_file: depend_on_referenced_packages

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/commponted/Widget/MyAcceptDates.dart';
import 'package:user/shard/commponted/Widget/MyCancelDate.dart';
import 'package:user/shard/commponted/Widget/MyPandingDates.dart';
import 'package:user/shard/commponted/item/itemdate.dart';
import 'package:user/shard/cubit/MainLayout/Scheduled/cubitScheduled.dart';
import 'package:user/shard/cubit/MainLayout/Scheduled/statesScheduled.dart';

class ScheduledView extends StatelessWidget {
  const ScheduledView({super.key});

  @override
  Widget build(BuildContext context) {
    //var dateController = DatePickerController();
    // cubit.getDtare(FirebaseAuth.instance.currentUser!.uid);
    //cubit.date;
    return BlocProvider(
      create: (context) {
        return AppCubitScheduled();
      },
      child: BlocConsumer<AppCubitScheduled, AppStatesScheduled>(
        // ignore: curly_braces_in_flow_control_structures
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubitScheduled.get(context);
          // List<String> u = cubit.daneDate;
          //print(u);
          return Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'جدول الواعيد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ButtonsTabBar(
                    height: 50,
                    radius: 15,
                    onTap: (value) async {
                      cubit.changeIndexAppBar(value);
                      // cubit.getAllDates(uid, DateTime.now().month.toString(),
                      //     DateTime.now().day.toString());
                      // await FirebaseMessaging.instance.getToken().then((value) {
                      //   print(
                      //       "--------------------------------------------------------------");
                      //   print(value);
                      //});

                      //ignore: curly_braces_in_flow_control_structures
                    },
                    backgroundColor: Colors.blue,
                    unselectedBackgroundColor: Colors.grey[900],
                    unselectedLabelStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                        child: ItemTabBarAdvenved(
                          titel: '   مواعيدي القادمة',
                        ),
                      ),
                      Tab(child: ItemTabBarAdvenved(titel: 'المواعيد الملغية')),
                      Tab(
                          child:
                              ItemTabBarAdvenved(titel: '   مواعيدي المعلقة')),
                    ],
                  ),
                  // Expanded(
                  //  child:
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        //   MyAcceptDates(),
                        if (cubit.currentIndexApp == 0) const MyAcceptDates(),
                        if (cubit.currentIndexApp == 1) const MyCancelDate(),
                        if (cubit.currentIndexApp == 2) const MyPandingDates()
                      ],
                    ),
                  ),
                  // )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemTabBarAdvenved extends StatelessWidget {
  const ItemTabBarAdvenved({
    super.key,
    required this.titel,
  });
  final String titel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Center(
          child: Text(
        titel,
        style: const TextStyle(
            fontFamily: 'jannah', fontSize: 15, color: Colors.white),
      )),
    );
  }
}
