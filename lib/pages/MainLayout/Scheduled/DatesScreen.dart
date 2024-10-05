// // ignore_for_file: depend_on_referenced_packages

// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:date_picker_timeline/date_picker_widget.dart';

// import 'package:doctor/shard/compontrnd.dart';
// import 'package:doctor/shard/cubit/laithcibit.dart';
// import 'package:doctor/shard/cubit/statrsLaith.dart';
// import 'package:doctor/utils/constant.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DatesScreen extends StatelessWidget {
//   const DatesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var cubit = AppCubitLaith.get(context);
//     //var dateController = DatePickerController();
//     cubit.getDtare(FirebaseAuth.instance.currentUser!.uid);
//     cubit.date;
//     return BlocConsumer<AppCubitLaith, AppStateslaith>(
//       // ignore: curly_braces_in_flow_control_structures
//       listener: (context, state) {},
//       builder: (BuildContext context, AppStateslaith state) {
//         // List<String> u = cubit.daneDate;
//         //print(u);
//         return Scaffold(
//           body: DefaultTabController(
//             length: 3,
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const Text(
//                   'جدول الواعيد',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 ButtonsTabBar(
//                   height: 50,
//                   radius: 15,
//                   onTap: (value) async {
//                     AppCubitLaith.get(context).changeIndexAppBar(value);
//                     cubit.getAllDates(uid, DateTime.now().month.toString(),
//                         DateTime.now().day.toString());
//                     await FirebaseMessaging.instance.getToken().then((value) {
//                       print(
//                           "--------------------------------------------------------------");
//                       print(value);
//                     });

//                     // ignore: curly_braces_in_flow_control_structures
//                   },
//                   backgroundColor: Colors.blue,
//                   unselectedBackgroundColor: Colors.grey[900],
//                   unselectedLabelStyle: const TextStyle(color: Colors.white),
//                   labelStyle: const TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                   tabs: [
//                     Tab(
//                       child: SizedBox(
//                         height: 40,
//                         width: MediaQuery.of(context).size.width * 0.45,
//                         child: const Center(
//                             child: Text(
//                           '   مواعيدي القادمة',
//                           style: TextStyle(
//                               fontFamily: 'jannah',
//                               fontSize: 15,
//                               color: Colors.white),
//                         )),
//                       ),
//                     ),
//                     Tab(
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.45,
//                         child: const Center(
//                           child: Text(
//                             'المواعيد الملغية',
//                             style: TextStyle(
//                                 fontFamily: 'jannah',
//                                 fontSize: 15,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: SizedBox(
//                         height: 40,
//                         width: MediaQuery.of(context).size.width * 0.45,
//                         child: const Center(
//                             child: Text(
//                           '   مواعيدي المعلقة',
//                           style: TextStyle(
//                               fontFamily: 'jannah',
//                               fontSize: 15,
//                               color: Colors.white),
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       if (cubit.currentIndexApp == 0)
//                         MyAcceptDates(context, cubit, false),
//                       if (cubit.currentIndexApp == 1)
//                         MyCancelDate(context, cubit, true),
//                       if (cubit.currentIndexApp == 2)
//                         MyPandingDates(
//                           context,
//                           cubit,
//                         )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// Widget MyAcceptDates(context, AppCubitLaith cubit, bool canceld) => Expanded(
//       child: Column(
//         children: [
//           //Date Liner is here
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: DatePicker(
//               height: 90,
//               DateTime.now(),
//               // initialSelectedDate: DateTime.now(),
//               selectionColor: Colors.black,
//               selectedTextColor: Colors.white,
//               daysCount: 30,
//               onDateChange: (date) {
//                 FirebaseMessaging.instance.getToken().then((value) {
//                   print(
//                       "--------------------------------------------------------------");
//                   print(value);
//                 });
//                 cubit.selectdate(date);
//                 cubit.getAllDates(FirebaseAuth.instance.currentUser?.uid,
//                     date.month.toString(), date.day.toString());
//               },
//             ),
//           ),
//           Expanded(
//             child: cubit.loding
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : cubit.accepted_REQ.isEmpty
//                     ? const Center(
//                         child: Text("لايوجد مواعيد اليوم"),
//                       )
//                     : ListView.separated(
//                         physics: const BouncingScrollPhysics(),
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) => DatesInfoItemForMe(
//                             context,
//                             cubit.accepted_REQ[index],
//                             cubit.accepted_id[index],
//                             cubit,
//                             canceld: canceld),
//                         separatorBuilder: (context, index) =>
//                             const SizedBox(height: 5),
//                         itemCount: cubit.accepted_REQ.length,
//                       ),
//           ),
//         ],
//       ),
//     );
// Widget MyCancelDate(context, AppCubitLaith cubit, bool canceld) => Expanded(
//       child: ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemBuilder: (context, index) => DatesInfoItemForMe(
//             context, cubit.canceled_REQ[index], cubit.canceled_id[index], cubit,
//             canceld: canceld),
//         separatorBuilder: (context, index) => const SizedBox(height: 5),
//         itemCount: cubit.canceled_REQ.length,
//       ),
//     );
// Widget MyPandingDates(
//   context,
//   AppCubitLaith cubit,
// ) =>
//     Expanded(
//       child: ListView.separated(
//           shrinkWrap: true,
//           itemCount: cubit.pendind_REQ.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 5),
//           itemBuilder: ((context, index) {
//             return DatesInfoItem(context, cubit, cubit.pendind_REQ[index],
//                 cubit.pendind_id[index]);
//           })),
//     );
// // Widget MylateDate(context, AppCubitLaith cubit, bool canceld) => ListView.separated(
// //   physics: const BouncingScrollPhysics(),
// //   shrinkWrap: true,
// //   itemBuilder: (context, index) => DatesInfoItemForMe(
// //       context, cubit.canceled_REQ[index], cubit.canceled_id[index], cubit,
// //       canceld: canceld),
// //   separatorBuilder: (context, index) => const SizedBox(height: 5),
// //   itemCount: cubit.canceled_REQ.length,