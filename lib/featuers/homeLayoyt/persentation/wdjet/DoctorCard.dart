import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user/core/commponted/Dafult/DafultImageCircel.dart';
import 'package:user/core/utls/TextStyle.dart';
import 'package:user/core/utls/imagesData.dart';

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
                    DafultImageCircle(raduis: 40, url: imagesData.TimageDafult),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dr ll', style: textStyle.textStyle12),
                        Text('Doctor for ,,,,',
                            style: textStyle.textStyle12.copyWith(
                              color: const Color(0xff304250),
                              fontWeight: FontWeight.bold,
                            )),
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
                      child: const itemSatar(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

class itemSatar extends StatelessWidget {
  const itemSatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            IconlyBroken.star,
            size: 20,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 5,
          ),
          Text('kkkk stars',
              style: textStyle.textStyle12.copyWith(
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
