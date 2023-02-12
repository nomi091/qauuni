import 'package:flutter/material.dart';
import 'package:qauuni/utils/color.dart';
import 'package:qauuni/widgets/text.dart';

Widget homeContaner({size, image, txt}) {
  return Container(
    width: size.width * 0.45,
    height: size.width * 0.45,
    decoration: BoxDecoration(
      //   color: Colors.amber,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 199, 197, 197).withOpacity(0.2),
          offset: const Offset(2.0, 4.0),
          blurRadius: 5.0,
        ),
      ],
    ),
    child: Container(
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Center(
          child: Image.asset(
              // ignore: prefer_interpolation_to_compose_strings
              'assets/' + image,
              width: 100,
              height: 100,
              fit: BoxFit.fill),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        text(
            title: txt,
            color:black,
            fontsize: 13.0,
            fontweight: FontWeight.bold)
      ]),
    ),
  );

}
