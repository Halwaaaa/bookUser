import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/MainLayout/Home/stateHome.dart';

class AppCubitHome extends Cubit<AppStatesHome> {
  static AppCubitHome get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late bool isStart;
  late bool isAnimted;

  AppCubitHome() : super(AppInitStatesHome()) {
    init();
  }
  @override
  Future<void> close() {
    onclose();
    // TODO: implement close
    return super.close();
  }

  void init() {}

  void onclose() {}
  SkeletonizerDoctorCard() async {
    isStart = true;
    isAnimted = false;
    emit(AppStartSkeletonizerHome());
    await Future.delayed(const Duration(seconds: 5));
    isStart = false;

    emit(AppEndSkeletonizerHome());
  }

  AnimatedDoctorCard() async {
    isAnimted = false;
    emit(AppStartAnimtedHome());
    await Future.delayed(const Duration(seconds: 6));
    isAnimted = true;
    emit(AppEndAnimtedHome());
  }
}
