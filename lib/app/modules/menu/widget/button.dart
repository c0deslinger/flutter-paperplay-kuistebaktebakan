// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../global/widget/outlined_text.dart';

Widget Ribbon({required String label}) => Container(
      height: 60,
      width: 300,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/item/ribbon.png"),
              fit: BoxFit.fill)),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: outlinedText(
          text: label,
          fontSize: 20,
          textColor: Colors.white,
          strokeColor: const Color.fromARGB(255, 219, 138, 26),
        ),
      ),
    );

Widget ButtonBack({required BuildContext context}) => Positioned(
      width: 80,
      height: 70,
      top: -2,
      right: 0,
      child: GestureDetector(
        child: Image.asset("assets/images/item/button_corner_back.png"),
        onTap: () {
          debugPrint("back");
          Navigator.pop(context);
        },
      ),
    );

Widget ButtonExit({required BuildContext context, Function? onTap}) =>
    Positioned(
      width: 80,
      height: 70,
      top: -2,
      left: 0,
      child: GestureDetector(
        child: Image.asset("assets/images/item/button_corner_exit.png"),
        onTap: () {
          onTap!();
          debugPrint("exit");
          Navigator.pop(context);
        },
      ),
    );
