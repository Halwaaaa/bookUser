import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user/shard/constant/ImgeLink.dart';
import 'package:user/shard/cubit/MainLayout/Advenced/cubitAdvenced.dart';
import 'package:user/shard/cubit/MainLayout/Advenced/statesAdvenced.dart';

class ItemAdviceDoctor extends StatelessWidget {
  const ItemAdviceDoctor({
    super.key,
    required this.ismale,
  });
  final bool ismale;
  //final AppAdvencedCubit cubit;

  @override
  Widget build(BuildContext context) {
    final double wdith = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    var cubit = AppAdvencedCubit.get(context);

    return InkWell(
      onTap: () {
        //navigateTo(context,  DoctorView());
      },
      child: BlocConsumer<AppAdvencedCubit, AppAbvencedStates>(
        listener: (context, state) {},
        builder: (context, state) => Skeletonizer(
          enabled: cubit.isStart,
          child: TweenAnimationBuilder(
            curve: Curves.easeInToLinear,
            tween: Tween<Offset>(
                begin: const Offset(0, 100), end: const Offset(0, 0)),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) => Transform.translate(
              offset: cubit.isStart ? const Offset(0, 0) : value,
              child: child,
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: ismale
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageLink.manDafult,
                            errorListener: (value) {
                              print(value);
                            },
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 1),
                            imageBuilder: (context, imageProvider) => Container(
                              clipBehavior: Clip.antiAlias,
                              height: 230,
                              width: wdith / 2,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Colors.blue[200],
                              ),
                              child: Align(
                                alignment: ismale
                                    ? Alignment.bottomCenter
                                    : Alignment.bottomRight,
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(38),
                                      topRight: Radius.circular(38),
                                    ),
                                    image: DecorationImage(
                                        onError: (exception, stackTrace) {
                                          print(stackTrace);
                                          print(exception.toString());
                                        },
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                  /* child: Image(
                                              height: 200,
                                              image: NetworkImage(
                                                  'https://img.freepik.com/free-psd/App-with-hands-hips_1154-505.jpg?size=626&ext=jpg&ga=GA1.2.1248425010.1677387355&semt=ais'),
                                            ),*/
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: ismale ? 150 : null,
                  right: ismale ? null : 150,
                  top: 80,
                  child: Container(
                    height: wdith / 2 - 10,
                    width: wdith / 2 - 10,
                    decoration: const BoxDecoration(
                      color: Color(0xfff7f5fa),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(IconlyBroken.location),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'loctttion',
                              style:
                                  TextStyle(fontSize: 12, fontFamily: 'jannah'),
                            )
                          ],
                        ),
                        const Text(
                          'Dr. xxx',
                          style: TextStyle(fontSize: 15, fontFamily: 'jannah'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 25,
                              ),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'dddd',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: 'jannah'),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
