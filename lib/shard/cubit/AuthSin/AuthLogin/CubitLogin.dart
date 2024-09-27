import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/StateLogin.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class AppCubitLogin extends Cubit<AppStateLogin> {
  AppCubitLogin() : super(AppInitialStatesl()) {
    init();
  }

  late TextEditingController emilController;
  late TextEditingController PasswordController;
  late bool isloding;
  late double wdith;
  late double hight;

  static AppCubitLogin get(context) {
    return BlocProvider.of(context);
  }

  void init() {
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
}
