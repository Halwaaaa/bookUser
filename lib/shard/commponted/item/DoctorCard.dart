import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ItemDoctorCard(
  context,
) =>
    InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-fair-haired-beautiful-female-woman-with-broad-smile-thumbs-up_176420-14970.jpg?w=740&t=st=1677387568~exp=1677388168~hmac=7be1350ca20645b1de2db1d545e0a3785d3fc0c0879c0d8c93ae350795501103'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dr ll',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'jannah',
                          ),
                        ),
                        Text(
                          'Doctor for ,,,,',
                          style: TextStyle(
                            color: Color(0xff304250),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jannah',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          //   AppCubitLaith.get(context).getMyList();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.message,
                          color: Colors.blue,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Text(
                          'hjhh  years experians ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: 'jannah',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyBroken.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'kkkk stars',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'jannah',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
