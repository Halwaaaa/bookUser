import 'package:flutter/material.dart';
import 'package:user/featuers/homeLayoyt/persentation/view/Advenced/Advenced.dart';
import 'package:user/featuers/homeLayoyt/persentation/view/Advenced/advice_Screen.dart';
import 'package:user/featuers/homeLayoyt/persentation/view/Home/Home.dart';
import 'package:user/featuers/homeLayoyt/persentation/view/Scheduled/Scheduled.dart';
import 'package:user/modles/riveIcon.dart';

List<ModelsriveIcon> ModulesriveIcon = [
  ModelsriveIcon(
      artboard: 'House',
      src: 'Assest/Rive/new_file.riv',
      Time: 2000,
      TimeStart: 2000,
      stateMachingName: 'State Machine 1'),
  ModelsriveIcon(
      artboard: 'Paper',
      Time: 1400,
      TimeStart: 1200,
      src: 'Assest/Rive/new_file.riv',
      stateMachingName: 'State Machine 1'),
  ModelsriveIcon(
      artboard: 'Health',
      Time: 1500,
      TimeStart: 1500,
      src: 'Assest/Rive/new_file.riv',
      stateMachingName: 'State Machine 1'),
  ModelsriveIcon(
      artboard: 'Heart',
      Time: 2000,
      TimeStart: 2000,
      src: 'Assest/Rive/new_file.riv',
      stateMachingName: 'State Machine 1'),
];

List<Widget> ModulesScaarnLayout = [
  const HomeView(),
  const ScheduledView(),
  const AdviceView(),
  const Advenced(),
];
