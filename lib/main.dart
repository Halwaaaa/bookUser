import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/servers/localNot.dart';
import 'package:user/featuers/Auth/login/login_scarren.dart';
import 'package:user/featuers/Auth/sing/Sing.dart';
import 'package:user/featuers/MainLayout/persenation/view/Main.dart';
import 'package:user/featuers/homeLayoyt/layout.dart';
import 'package:user/core/servers/Email.dart';
import 'package:user/core/constant/blocBrovide.dart';
import 'package:user/core/constant/methed.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/cubitAuth.dart';
import 'package:user/shard/cubit/MainLayout/loyout/cubitLoyout.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await AndroidAlarmManager.initialize();

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
