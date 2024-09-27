import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/StateLogin.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class AppCubitLogin extends Cubit<AppStateLogin> {
  AppCubitLogin() : super(AppInitialStatesl()) {
    init();
  }

  void init() {}
  @override
  Future<void> close() {
    Onclose();

    // TODO: implement close
    return super.close();
  }

  void Onclose() {}
}
