import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:user/core/servers/localNot.dart';
import 'package:user/featuers/Auth/presenation/viwe/login/login_scarren.dart';
import 'package:user/featuers/MainLayout/persenation/view/Main.dart';
import 'package:user/featuers/homeLayoyt/layout.dart';
import 'package:user/core/servers/Email.dart';
import 'package:user/core/constant/blocBrovide.dart';
import 'package:user/core/constant/methed.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/cubitAuth.dart';
import 'package:user/shard/cubit/MainLayout/loyout/cubitLoyout.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  WorkDo();
}

void main() async {
  initApp();

  // تسجيل المهمة

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ServersEmail().sendEmail();
    //Dafult(context: context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubitSin()),
        BlocProvider(create: (context) => AppCubitLoyout()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: const Locale('ar'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Main(),
      ),
    );
  }
}

void WorkDo() {
  return Workmanager().executeTask((task, inputData) async {
    print(task);
    print(inputData);
    print("dddddddddddddddddddddddddddd");
    Noti().showBigTextNotification(
        title: "منبه دوائي",
        body: "${inputData!['h']}:${inputData['m']}موعد الدواء الان",
        id: inputData['id']);

    // منطق المهمة
    return Future.value(true);
  });
}

void initApp() {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  WidgetsFlutterBinding.ensureInitialized();
  Noti.initialize(flutterLocalNotificationsPlugin, (p0) => null);
  Workmanager().cancelAll();
  // await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  // await AndroidAlarmManager.initialize();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}
