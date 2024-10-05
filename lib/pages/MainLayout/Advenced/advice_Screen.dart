import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:user/shard/commponted/Dafult/DafultImageCircel.dart';
import 'package:user/shard/commponted/item/ItemAdvice.dart';
import 'package:user/shard/constant/ImgeLink.dart';
import 'package:user/shard/cubit/MainLayout/Advenced/cubitAdvenced.dart';
import 'package:user/shard/cubit/MainLayout/Advenced/statesAdvenced.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  AppCubitLaith.get(context).getLocation();
        //showToast(text: position.toString(), state: ToastStates.SUCCESS);
        BlocProvider(
      create: (context) {
        return AppAdvencedCubit()..SkeletonizerDoctorCard();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyBroken.arrowLeft,
              color: Colors.grey,
            ),
          ),
          title: const Center(
            child: Text(
              'نصائح طبية',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'jannah',
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DafultImageCircle(
                url: ImageLink.manDafult,
                raduis: 25,
              ),
            )
          ],
        ),
        body: ConditionalBuilder(
          condition: true,
          builder: (context) {
            return BlocConsumer<AppAdvencedCubit, AppAbvencedStates>(
              listener: (context, state) {},
              builder: (context, state) => Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: ((context, index) => (index % 2 == 0)
                          ? const ItemAdviceDoctor(
                              ismale: true,
                              // cubit: cubit,
                            )
                          : const ItemAdviceDoctor(
                              ismale: false,
                              //  cubit: cubit,
                            )),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: 10,
                    ),
                  )
                ],
              ),
            );
          },
          fallback: (context) => const Center(
              child: Icon(
            Icons.hourglass_empty,
            size: 25,
          )),
        ),
      ),
    );
  }
}
