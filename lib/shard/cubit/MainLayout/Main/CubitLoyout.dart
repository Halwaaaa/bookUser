import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/MainLayout/loyout/statesLoyout.dart';
import 'package:rive/rive.dart';

class AppCubitMain extends Cubit<AppStatesLoyout> {
  late StateMachineController? controllerDrawer;

  late bool initState1;
  late bool isStart;
  late bool isTapMeun;
  late SMIBool? isDrawer;
  late bool isDrawerOpan;
  AppCubitMain() : super(AppinitLoyout()) {
    init();
  }
  @override
  Future<void> close() {
    // TODO: implement close
    Colse();
    return super.close();
  }

  void init() {
    isDrawerOpan = false;
    initState1 = true;
    isStart = true;
    isTapMeun = false; // isDrawer?.value = false;
  }

  void changed() {
    isStart = !isStart;
  }

  void Colse() {
    controllerDrawer?.dispose();
  }

  static AppCubitMain get(context) {
    return BlocProvider.of(context);
  }

  void ControllerDarwer(
    bool value,
  ) {
    isDrawerOpan = value;
    emit(AppEndOpenDrawerLoyout());
  }

  void OnInitDrawer(Artboard artboard) {
    controllerDrawer =
        StateMachineController.fromArtboard(artboard, "State Machine");
    if (controllerDrawer != null) {
      artboard.addController(controllerDrawer!);
    }
    isDrawer = controllerDrawer?.findSMI("isOpen") as SMIBool;
    isDrawer?.value = true;
    // initState1 = false;
  }

  onTapDrawer() {
    ControllerDarwer(isDrawer!.value);
    isTapMeun = true;
    emit(AppStartOpenDrawerLoyout());

    Future.delayed(
      const Duration(seconds: 1),
      () {
        isDrawer!.value = !isDrawer!.value;
      },
    );
    isTapMeun = false;

    initState1 = false;
    emit(AppEndOpenDrawerLoyout());
  }
}
