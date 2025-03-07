import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import 'package:user/modules/Modules.dart';
import 'package:user/core/constant/config.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/StateLogin.dart';
import 'package:user/shard/cubit/MainLayout/Home/cubitHome.dart';
import 'package:user/shard/cubit/MainLayout/loyout/cubitLoyout.dart';
import 'package:user/shard/cubit/MainLayout/loyout/statesLoyout.dart';

class layoutView extends StatefulWidget {
  const layoutView({super.key});

  @override
  State<layoutView> createState() => _layoutViewState();
}

class _layoutViewState extends State<layoutView> {
  List<StateMachineController?>? controller = [];
  RiveAnimationController? controller2;
  SMIBool? ih;
  SMIBool? ih1;
  SMIBool? ih2;
  late bool hh;
  SMITrigger? triggerInput;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hh = true;

    // controller =StateMachineController(s)
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubitLoyout.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BlocProvider(
            create: (context) => AppCubitHome(),
            child: BlocConsumer<AppCubitLoyout, AppStatesLoyout>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Expanded(
                      child: ModulesScaarnLayout[cubit.indexOfScren]);
                }),
          ),
          Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              height: 60,
              decoration: ShapeDecoration(
                  color: Config().PrimerColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(20)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(ModulesriveIcon.length, (index) {
                  return GestureDetector(
                    onTap: () async {
                      cubit.TapIconRive(index, ModulesriveIcon[index].TimeStart,
                          ModulesriveIcon[index].Time);
                    },
                    child: RiveAnimation.asset(
                      ModulesriveIcon[index].src,
                      controllers: const [],
                      useArtboardSize: true,
                      artboard: ModulesriveIcon[index].artboard,
                      onInit: (p0) {
                        cubit.onInit(
                            p0, ModulesriveIcon[index].stateMachingName, index);
                      },
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }
}
