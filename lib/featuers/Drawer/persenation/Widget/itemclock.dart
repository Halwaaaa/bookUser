import 'package:flutter/material.dart';
import 'package:user/core/constant/config.dart';
import 'package:user/featuers/Drawer/persenation/Widget/itemclockopen.dart';
import 'package:user/shard/cubit/Darwer.dart/cubitclock.dart';

class ItemClock extends StatelessWidget {
  const ItemClock({super.key, required this.index, required this.cubit});

  final int index;
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    bool isdaliy = cubit.Time[index]["daliy"] == 1 ? true : false;
    int isopen = cubit.Time[index]["week"];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isopen == 0 ? 150 : 250,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 250, 247),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.tapIconOpenClock(isopen, index);
                      },
                      icon: isopen == 0
                          ? const Icon(Icons.add)
                          : const Icon(Icons.close),
                      color: Colors.black,
                    ),
                    const Spacer(),
                    Text(
                      "${cubit.Time[index]["name"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.changedStatusClock(index);
                      },
                      child: Container(
                        width: 55,
                        height: 35,
                        decoration: ShapeDecoration(
                            color: cubit.Time[index]["status"] == "do"
                                // isShowDateles1[index]
                                ? Config().PrimerColor
                                : Colors.white,
                            shape: const ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        end: Radius.circular(35),
                                        start: Radius.circular(35)))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: AnimatedAlign(
                            duration: const Duration(milliseconds: 500),
                            alignment: cubit.Time[index]["status"] == "do"
                                ? AlignmentDirectional.topEnd
                                : AlignmentDirectional.topStart,
                            child: Container(
                              width: 25,
                              decoration: ShapeDecoration(
                                  color: cubit.Time[index]["status"] == "do"
                                      // isShowDateles1[index]
                                      ? Colors.white
                                      : Colors.black12,
                                  shape: const CircleBorder()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      cubit.Time[index]["Hour"] == 0
                          ? "12:${cubit.Time[index]["min"]} am"
                          : cubit.Time[index]["Hour"] > 12
                              ? "${cubit.Time[index]["Hour"] - 12}:${cubit.Time[index]["min"]} pm"
                              : "${cubit.Time[index]["Hour"]}: ${cubit.Time[index]["min"]} am",
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
                isopen == 1
                    ? ItemopenClock(
                        valueboxdaliy: isdaliy,
                        onchangedWeek: (p0) {
                          cubit.changedDaliyClock(index, isdaliy);
                        },
                        onchangedDaliy: (p0) {
                          cubit.changedDaliyClock(index, isdaliy);
                        },
                        valueboxWeek: !isdaliy,
                        ontap: () {
                          cubit.dalteBase(id: cubit.Time[index]["id"]);
                        },
                      )
                    : const SizedBox()
              ],
            )),
      ),
    );
  }
}
