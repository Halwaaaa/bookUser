import 'package:flutter/material.dart';

class Config {
  Color colorApp = const Color.fromRGBO(230, 246, 246, 1);
  Color colorAppbar = const Color.fromRGBO(246, 225, 216, 1);
  Color colorAppbarDark = const Color.fromRGBO(160, 142, 164, 1);
  Color colorTextDark = const Color.fromRGBO(243, 233, 245, 1);

  Color colorCircelAvater = const Color.fromRGBO(217, 217, 217, 1);
  Color colorSmailText = const Color.fromRGBO(140, 138, 140, 1);
  Color colorBackgroundDark = const Color.fromRGBO(69, 85, 85, 10);
  Color PrimerColor = const Color.fromRGBO(135, 206, 235, 1);

  Color colorAppbar2 = const Color.fromRGBO(34, 139, 34, 1);
  Color colorAppbar3 = const Color.fromRGBO(211, 211, 211, 1);
  Color colorAppbarDark2 = const Color.fromRGBO(217, 233, 233, 1);
  Color colorTextDark2 = const Color.fromRGBO(216, 232, 232, 1);

  Color colorBorder = const Color.fromRGBO(243, 233, 245, 1);
  //Color colorBorder = const Color.fromRGBO(243, 233, 245, 1);
  Color colorMothersDayOfferBorder = const Color.fromRGBO(255, 227, 214, 2);
  Color colorMothersDayOfferTitle = const Color.fromRGBO(112, 112, 112, 1);
  //(243, 233, 245, 1)

  // background: rgba;
  Widget smallSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget AvgSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
    );
  }

  Widget LargeSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
    );
  }

  TextStyle TextHomePage(bool isdark) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: isdark ? colorAppbarDark2 : PrimerColor);
  }

  BoxShadow shadowContiner() {
    return const BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.25));
  }

  BorderRadiusDirectional borderRadius() {
    return const BorderRadiusDirectional.only(
      topStart: Radius.circular(6),
      topEnd: Radius.circular(6),
      bottomStart: Radius.circular(26),
      bottomEnd: Radius.circular(6),
    );
  }

  TextStyle TextFlowerFliter(bool isDark) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: isDark ? colorAppbarDark2 : PrimerColor);
  }

  TextStyle TextFlowerdetailsTitle(bool isDark) {
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: isDark ? colorTextDark2 : PrimerColor);
  }

  TextStyle TextFlowerdetailsInformation(bool isDark) {
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: isDark ? const Color.fromRGBO(241, 241, 241, 1) : Colors.black);
  }

  TextStyle TextMyCartOrder(
    Color colorText,
  ) {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: colorText);
  }

  TextStyle TextInformationOrderTitle(bool isDark) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDark
            ? const Color.fromRGBO(241, 241, 241, 1)
            : const Color.fromRGBO(140, 138, 140, 1));
  }

  TextStyle TextInformationOrderboby() {
    return TextStyle(
        fontSize: 15, fontWeight: FontWeight.w500, color: PrimerColor);
  }

  TextStyle TextTabBarTitle(bool isDark) {
    return TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: isDark ? colorTextDark2 : PrimerColor);
  }

  TextStyle TextPaymentTitle(bool isDark) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: isDark ? colorTextDark2 : PrimerColor);
  }

  TextStyle TextPaymentboby(bool isDark) {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color:
            isDark ? const Color.fromRGBO(241, 241, 241, 1) : colorSmailText);
  }

  ShapeDecoration ImageDetailsSelectedDecoration(bool isDark) {
    return ShapeDecoration(
        shape: ContinuousRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            side: BorderSide(
                width: 3, color: isDark ? colorTextDark2 : PrimerColor)));
  }

  String? Function(String?)? validator = (p0) {
    if (p0!.isEmpty) {
      return 'الحقل مطلوب';
    }
    return null;
  };
}
