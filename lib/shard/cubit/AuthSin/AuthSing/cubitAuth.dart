import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/featuers/Auth/presenation/viwe/Verification/Verification.dart';
import 'package:user/featuers/Auth/presenation/viwe/login/login_scarren.dart';
import 'package:user/core/servers/internet.dart';
import 'package:user/core/commponted/Dafult/DafiltAwssdailog.dart';
import 'package:user/core/constant/pageRoute.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class AppCubitSin extends Cubit<AppStatesSing> {
  late TextEditingController NameControol;
  late TextEditingController phoneControol;
  late TextEditingController EmailControol;
  late TextEditingController PasswordControol;
  late bool loding;
  late internetConection conection;

  var keyform = GlobalKey<FormState>();

  AppCubitSin() : super(AppInitialStates()) {
    oninit();
  }
  static AppCubitSin get(context) {
    return BlocProvider.of(context);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    OnClose();
    return super.close();
  }

  void oninit() {
    conection = internetConection();
    loding = false;
    FirebaseAuth.instance.setLanguageCode('ar');
    NameControol = TextEditingController();

    phoneControol = TextEditingController();

    EmailControol = TextEditingController();

    PasswordControol = TextEditingController();
  }

  void OnClose() {}

  TapSin(BuildContext context) {
    if (keyform.currentState!.validate()) {
      SingWithEmail(context);
      //  checkIfEmailRegisteredWithGoogle(context);
    }
  }

  Future<void> checkIfEmailRegisteredWithGoogle(BuildContext context) async {
    lodingTrue();

    await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(EmailControol.text)
        .then((value) {
      lodingFalse();
      if (value.isNotEmpty) {
        DafultAwssomeDialog(context, massges: "Email Regsiter try log in")
            .show();
      } else {
        SingWithEmailandPassWord(context);
      }
    }).catchError((error) {
      lodingFalse();
      if (error is FirebaseAuthException) {
        if (error.message?.contains('403') == true) {
          DafultAwssomeDialog(context, massges: 'الوقع غير فغال فى منطقتك')
              .show();
        } else {
          DafultAwssomeDialog(context, massges: error.message.toString())
              .show();
        }
        // print();
      }

      //print(ff.toString());
    });
  }

  void lodingTrue() {
    loding = true;
    emit(AppLodingTrueStates());
  }

  void lodingFalse() {
    loding = false;
    emit(AppLodingFalseStates());
  }

  void SingWithEmail(BuildContext context) async {
    //انشاء حساب

    //تفقد الاتصال بل الانترنت
    await conection.checkInternet().then((value) {
      print('lll');

      //فحص وجود الايميل
      checkIfEmailRegisteredWithGoogle(context);
    }).catchError((error) {
      if (error is internetConectionEx) {
        lodingFalse();
        //فشل الاتصال بل الانترنت
        DafultAwssomeDialog(context, massges: error.message).show();
      }
    });
  }

  Future<void> SingWithEmailandPassWord(BuildContext context) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: EmailControol.text, password: PasswordControol.text)
        .then((value) async {
      sing(value, context);
      // await value.user?.getIdToken().then((value) {
      //   print(value);
      // });
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        print(error.message?.contains('403'));
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

  void sing(UserCredential value, BuildContext context) {
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(
    //         email: EmailControol.text, password: PasswordControol.text)
    //     .then((value) {
    //value.user?.sendEmailVerification();
    Navigator.push(context, page(pagee: const Login()));
    //});
  }
}
