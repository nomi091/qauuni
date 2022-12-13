import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:qauuni/utils/color.dart';

class Utils {
  // static toastMessage(String message) {
  //   msg:
  //   message;
  //   backgroundColor:
  //   Colors.black;
  // }

  static void fieldFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        reverseAnimationCurve: Curves.decelerate,
        positionOffset: 20,
        borderColor: black,
        borderRadius: BorderRadius.circular(20),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: white,
        ),
        message: message,
      )..show(context),
    );
  }
}
