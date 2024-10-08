import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user/core/constant/config.dart';

class myprofiles extends StatelessWidget {
  const myprofiles({
    super.key,
    required this.height,
    required this.config,
  });
  final double height;
  final Config config;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
            color: config.PrimerColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          onBackgroundImageError: (exception, stackTrace) {},
                          radius: height * 0.25,
                          backgroundImage: const NetworkImage(
                              'https://img.freepik.com/free-photo/portrait-fair-haired-beautiful-female-woman-with-broad-smile-thumbs-up_176420-14970.jpg?w=740&t=st=1677387568~exp=1677388168~hmac=7be1350ca20645b1de2db1d545e0a3785d3fc0c0879c0d8c93ae350795501103')),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Text(
                            "lll",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 23,
                                fontFamily: 'jannah'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: const Icon(
                                  FontAwesomeIcons.clock,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: const Icon(
                                  CupertinoIcons.camera,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyBroken.send,
                            color: Colors.black,
                            size: 20,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
