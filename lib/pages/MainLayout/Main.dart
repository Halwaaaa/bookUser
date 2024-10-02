import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/pages/MainLayout/Drawer/List.dart';
import 'package:user/pages/MainLayout/layout.dart';
import 'package:user/shard/commponted/Widget/button_meun.dart';
import 'package:user/shard/cubit/MainLayout/Main/CubitLoyout.dart';
import 'package:user/shard/cubit/MainLayout/loyout/cubitLoyout.dart';
import 'package:user/shard/cubit/MainLayout/loyout/statesLoyout.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubitMain(),
      child: BlocConsumer<AppCubitMain, AppStatesLoyout>(
          listener: (context, state) {
        if (state is AppControolDrawerLoyout) {
          //setState(() {});
        }
      }, builder: (context, state) {
        var cubit = AppCubitMain.get(context);
        return SafeArea(
          child: Container(
            // color: const Color(0xFF17203A),
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: DrawerView(),
              ),
              Mainloyout(cubit: cubit),
              AnimatedAlign(
                duration: const Duration(seconds: 1),
                alignment: !cubit.isDrawerOpan
                    ? AlignmentDirectional.topStart
                    : AlignmentDirectional.topEnd,
                child: Boutton_meun(
                  Artboard: (Artboard) {
                    cubit.OnInitDrawer(Artboard);
                  },
                  prees: () {
                    !cubit.isTapMeun ? cubit.onTapDrawer() : null;
                  },
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}

class Mainloyout extends StatelessWidget {
  const Mainloyout({
    super.key,
    required this.cubit,
  });

  final AppCubitMain cubit;

  @override
  Widget build(BuildContext context) {
    double wdith = MediaQuery.sizeOf(context).width;
    final isDrawerOpen = cubit.isDrawerOpan;
    final isInitial = cubit.initState1;

    final offsetBegin =
        isDrawerOpen ? const Offset(0, 0) : Offset(wdith * 0.6, 0);
    final offsetEnd =
        isDrawerOpen ? Offset(wdith * 0.6, 0) : const Offset(0, 0);
    final double rotationBegin = isDrawerOpen ? 0 : 0.2;
    final double rotationEnd = isDrawerOpen ? 0.2 : 0;
    final borderRadius =
        isDrawerOpen ? BorderRadius.circular(30) : BorderRadius.zero;
    return TweenAnimationBuilder(
      onEnd: () {
        cubit.changed();
      },
      tween: Tween<Offset>(
        begin: offsetBegin,
        end: offsetEnd,
      ),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) => Transform.translate(
        offset: isInitial ? const Offset(0, 0) : value,
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: rotationBegin, end: rotationEnd),
          builder: (context, value, child) => Transform.rotate(
              angle: !cubit.initState1 ? value : 0, child: child),
          child: AnimatedRotation(
              alignment: Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              turns: cubit.isDrawerOpan ? 0.001 : 0,
              child: AnimatedScale(
                  duration: const Duration(seconds: 1),
                  scale: cubit.isDrawerOpan ? 0.9 : 1,
                  child: ClipRRect(
                      borderRadius:
                          cubit.isDrawerOpan ? borderRadius : BorderRadius.zero,
                      child: const Home()))),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cudit = AppCubitMain.get(context);
    return const SizedBox(
        width: double.infinity, height: double.infinity, child: layoutView());
  }
}
