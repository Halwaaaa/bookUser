import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/MainLayout/loyout/statesLoyout.dart';
import 'package:rive/rive.dart';

class AppCubitLoyout extends Cubit<AppStatesLoyout> {
  late List<StateMachineController?>? controller;
  late List<bool> initState;
  AppCubitLoyout() : super(AppinitLoyout()) {
    init();
  }
  @override
  Future<void> close() {
    // TODO: implement close
    Colse();
    return super.close();
  }

  void init() {
    controller = [];
    initState = List.generate(4, (index) => true);
  }

  void Colse() {
    controller?.forEach((element) {
      element?.dispose();
    });
  }

  static AppCubitLoyout get(context) {
    return BlocProvider.of(context);
  }

  void onInit(Artboard artboard, String stateMachineName, int index) {
    StateMachineController? riveCont = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
      onStateChange: (stateMachineName, stateName) {
        print(stateName);
      },
    );
    if (riveCont != null) {
      controller?.add(riveCont);
      print(controller?.isEmpty);
      riveCont.advanceInputs();
      // print(p0.animations);
      if (controller?[index] != null) {
        artboard.addController(controller![index]!);
      }
      controller?[index]?.isActive = false;
    }
  }

  Future<void> TapIconRive(int index, int startTime, int Time) async {
    controller?[index]?.isActive = true;
    await Future.delayed(
      Duration(milliseconds: initState[index] ? startTime : Time),
    );

    controller?[index]?.isActive = false;
    initState[index] = false;
  }
}
