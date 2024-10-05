import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/MainLayout/Advenced/statesAdvenced.dart';
import 'package:user/shard/cubit/MainLayout/Home/stateHome.dart';

class AppAdvencedCubit extends Cubit<AppAbvencedStates> {
  late bool isStart;
  late bool isAnimted;
  AppAdvencedCubit() : super(AppInitStatesAdvenced()) {
    init();
  }
  static AppAdvencedCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void init() {}
  SkeletonizerDoctorCard() async {
    isStart = true;
    emit(AppStartSkeletonizerAbvenced());
    await Future.delayed(const Duration(seconds: 5));
    isStart = false;

    emit(AppEndSkeletonizerAbvenced());
  }

  AnimatedDoctorCard() async {
    isAnimted = false;
    emit(AppStartAnimtedAbvenced());
    await Future.delayed(const Duration(seconds: 6));
    isAnimted = true;
    emit(AppEndAnimtedAbvenced());
  }
}
