import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/servers/internet.dart';
import 'package:user/shard/commponted/Dafult/DafiltAwssdailog.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/StateLogin.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class AppCubitLogin extends Cubit<AppStateLogin> {
  AppCubitLogin() : super(AppInitialStatesl()) {
    init();
  }

  late TextEditingController emilController;
  late TextEditingController PasswordController;
  late internetConection conection;
  late bool isloding;

  var keyFor = GlobalKey<FormState>();

  static AppCubitLogin get(context) {
    return BlocProvider.of(context);
  }

  void init() {
    conection = internetConection();
    emilController = TextEditingController();
    PasswordController = TextEditingController();
    isloding = false;
  }

  @override
  Future<void> close() {
    Onclose();

    // TODO: implement close
    return super.close();
  }

  void Onclose() {
    emilController.dispose();
    PasswordController.dispose();
  }

  void tapLogin(BuildContext context) async {
    //تسجيل الدخول
    if (keyFor.currentState!.validate()) {
      //تفقد الاتصال بل الانترنت
      await conection.checkInternet().then((value) {
        print('lll');
        SingWithEmail(context);
      }).catchError((error) {
        if (error is internetConectionEx) {
          //فشل الاتصال بل الانترنت
          DafultAwssomeDialog(context, massges: error.message).show();
        }
      });
    }
  }

  void SingWithEmail(BuildContext context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emilController.text, password: PasswordController.text)
        .then((value) => null)
        .catchError((error) {
      if (error is FirebaseAuthException) {
        if (error.message?.contains('403') == true) {
          DafultAwssomeDialog(context, massges: 'الوقع غير فغال فى منطقتك')
              .show();
        } else {
          DafultAwssomeDialog(context, massges: error.message.toString())
              .show();
        }
      }
    });
  }
}
