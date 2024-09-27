import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/commponted/Dafult/DafiltAwssdailog.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class AppCubitSin extends Cubit<AppStatesSing> {
  late TextEditingController NameControol;
  late TextEditingController phoneControol;
  late TextEditingController EmailControol;
  late TextEditingController PasswordControol;
  late bool loding;
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
    loding = false;
    FirebaseAuth.instance.setLanguageCode('ar');
    NameControol = TextEditingController();

    phoneControol = TextEditingController();

    EmailControol = TextEditingController();

    PasswordControol = TextEditingController();
  }

  void OnClose() {}

  SingWithEmail(BuildContext context) {
    if (keyform.currentState!.validate()) {
      checkIfEmailRegisteredWithGoogle(context);
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
        DafultAwssomeDialog(context, massges: error.message.toString()).show();
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

  Future<void> SingWithEmailandPassWord(BuildContext context) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: EmailControol.text, password: PasswordControol.text)
        .then((value) async {
      await FirebaseAuth.instance.currentUser!
          .sendEmailVerification()
          .then((value) {
        print("sss");
      });
      // await value.user?.getIdToken().then((value) {
      //   print(value);
      // });
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        print(error.message);

        DafultAwssomeDialog(context, massges: error.message.toString()).show();
      }
    });
  }
}
