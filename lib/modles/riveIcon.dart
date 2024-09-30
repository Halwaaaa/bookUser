import 'package:rive/rive.dart';

class ModelsriveIcon {
  final String src;
  final String artboard;
  final String stateMachingName;
  final int TimeStart;
  final int Time;
  late SMIBool? states;
  ModelsriveIcon({
    required this.artboard,
    required this.Time,
    required this.TimeStart,
    required this.src,
    required this.stateMachingName,
    this.states,
  });
  set setStatus(SMIBool state) {
    states = state;
  }
}
