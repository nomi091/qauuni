
import 'package:flutter/material.dart';
import 'package:qauuni/widgets/text.dart';

Container textIconFunRow(
    {title, icon, fontsize, iconColor, fontColor, iconSize}) {
  return Container(
    child: Row(children: [
      Icon(icon, size: iconSize, color: iconColor),
      const SizedBox(
        width: 6,
      ),
      text(title: title, fontsize: fontsize, color: fontColor),
    ]),
  );
}

Container textIconFunColumn({ title,icon,fontsize,iconColor,fontColor}) {
  return Container(
    child: Column(
      children: [
     Icon(icon,size: 20,color:iconColor ),
    const SizedBox(width: 6,),
     text(title:title,fontsize: fontsize,color:fontColor ),
    ]),
    );
}