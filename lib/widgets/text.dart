import 'package:flutter/material.dart';

Text text({title, fontsize, fontweight, color}) {
  return Text(
    title,
    //overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color,
    ),
  );
}

Text textStart({title, fontsize, fontweight, color}) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color,
    ),
  );
}
