import 'package:flutter/material.dart';
import 'package:qauuni/widgets/text.dart';

Container textIconFunRow({ title,icon,fontsize,iconColor,fontColor,iconSize}) {
  return Container(
    child: Row(
      children: [
     Icon(icon,size: iconSize,color:iconColor ),
    SizedBox(height: 10,),
     text(title:title,fontsize: fontsize,color:fontColor ),
    ]),
    );
}


Container IconTextFun({ title,icon,fontsize,iconColor,fontColor}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
     Icon(icon,size: 20,color:iconColor ),
     SizedBox(width: 20,),
     text(title:title,fontsize: fontsize,color:fontColor ),
    ]),
    );
}
