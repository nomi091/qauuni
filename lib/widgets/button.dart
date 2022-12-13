import 'package:flutter/material.dart';
import 'package:qauuni/widgets/text.dart';


Widget button({title, width, height, fsize, bgColor, txtColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: bgColor,
    ),
    height: height,
    width: width,
    child: Center(
      child: text(
          title: title,
          fontsize: fsize,
          fontweight: FontWeight.w500,
          color: txtColor),
    ),
  );
}