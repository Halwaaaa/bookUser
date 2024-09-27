import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/pages/Auth/login/login_scarren.dart';
import 'package:user/pages/Auth/sing/Sing.dart';
import 'package:user/shard/constant/blocBrovide.dart';
import 'package:user/shard/constant/methed.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/cubitAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Dafult(context: context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubitSin()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        locale: const Locale('ar'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Login(),
      ),
    );
  }
}
