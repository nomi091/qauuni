import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qauuni/repository/auth_reposotory.dart';
import 'package:qauuni/utils/utils.dart';

import '../routes/route.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((response) {

      if (kDebugMode) {
        print(response["error"].toString());
      }
      if (response["error"] == false) {
        Utils.flushBarErrorMessage("Login Successfull", context);
         Get.toNamed(Routes.home);
      } else {
        Utils.flushBarErrorMessage("Incorrect Username or Password", context);
      }
      // Get.toNamed(Routes.home);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApis(dynamic data, BuildContext context) async {
    _myRepo.signUpApi(data).then((value) {
      //  Utils.flushBarErrorMessage("Login Successfull", context);
      Utils.flushBarErrorMessage(value.toString(), context);
      // Get.toNamed(Routes.home);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}
