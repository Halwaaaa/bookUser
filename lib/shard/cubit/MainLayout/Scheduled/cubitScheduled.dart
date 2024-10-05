import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/MainLayout/Scheduled/statesScheduled.dart';

class AppCubitScheduled extends Cubit<AppStatesScheduled> {
  int currentIndexApp = 0;
  AppCubitScheduled() : super(AppInitStatesScheduled());

  static AppCubitScheduled get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void changeIndexAppBar(int value) {
    currentIndexApp = value;
    emit(AppchangeIndexAppBarScheduled());
  }
}
