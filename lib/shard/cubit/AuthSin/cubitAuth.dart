import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/cubit/AuthSin/stateAuth.dart';

class AppCubitSin extends Cubit<AppStatesSing> {
  AppCubitSin() : super(AppInitialStates());
  static AppCubitSin get(context) {
    return BlocProvider.of(context);
  }
}
