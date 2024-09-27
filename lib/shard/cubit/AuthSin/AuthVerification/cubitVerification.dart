import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';
import 'package:user/shard/cubit/AuthSin/AuthVerification/stateVerification.dart';

class AppCubitVerification extends Cubit<AppStatesVerification> {
  AppCubitVerification() : super(AppInitVerification()) {
    oninit();
  }

  void oninit() {}
}
