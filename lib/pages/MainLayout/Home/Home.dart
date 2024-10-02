import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user/shard/commponted/Card/card_book.dart';
import 'package:user/shard/commponted/item/DoctorCard.dart';
import 'package:user/shard/commponted/Widget/Profile.dart';
import 'package:user/shard/constant/config.dart';
import 'package:user/shard/constant/methed%20copy.dart';
import 'package:user/shard/cubit/MainLayout/Home/cubitHome.dart';
import 'package:user/shard/cubit/MainLayout/Home/stateHome.dart';
import 'package:user/shard/cubit/MainLayout/loyout/statesLoyout.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubitHome.get(context);
    cubit.SkeletonizerDoctorCard();
    cubit.AnimatedDoctorCard();

    final double wdith = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    Config config = Config();
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: config.PrimerColor,
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                pinned: true,
                toolbarHeight: 100,
                expandedHeight: ResponsvTextSizemix(height * 0.32, 300),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  //   titlePadding: const EdgeInsetsDirectional.only(start: 40),
                  //  collapseMode: CollapseMode.parallax,
                  title: InkWell(
                    onTap: () {
                      //      navigateTo(context, SearchScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        //  color: Colors.grey.shade200
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                        child: Row(
                          children: [
                            Icon(IconlyBroken.search, color: Colors.black),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'ابحث عن طبيبك الان...',
                              style: TextStyle(
                                  fontFamily: 'jannah',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  expandedTitleScale: 1,
                  background: myprofiles(
                    config: config,
                    height: MediaQuery.sizeOf(context).height * 0.28,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          config.smallSpace(),
                          config.smallSpace(),
                          // Config.spaceSmall,
                          // const Sliderr(),
                          //  Config.spaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              card_book(
                                isone: true,
                                boby: Colors.black,
                                icon: Colors.white,
                                Card: () {
                                  //     navigateTo(
                                  //           context, const AddsScreen());
                                },
                                Card_name: "الاعلانات",
                                Card_data: "تصفح الاعلانات الموجودة",
                              ),
                              card_book(
                                  isone: false,
                                  boby: Colors.white,
                                  icon: Colors.grey,
                                  Card_name: "احجز عند اقرب طبيب",
                                  Card_data: "خرائط غوغل",
                                  Card: () async {})
                            ],
                          ),
                        ],
                      ),
                    ),
                    Config().smallSpace(),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "افضل الاطباء",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<AppCubitHome, AppStatesHome>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    // cubit.AnimatedDoctorCard();
                    return Skeletonizer.sliver(
                      enabled: !cubit.isStart ? false : true,
                      child: SliverAnimatedOpacity(
                        opacity: cubit.isStart
                            ? 1
                            : cubit.isAnimted
                                ? 1
                                : 0,
                        duration: const Duration(seconds: 2),
                        sliver: SliverList.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => ItemDoctorCard(
                            context,
                          ),
                        ),
                      ),
                    );
                  })
            ]));
  }
}
