import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:qauuni/repository/auth_repo/auth_reposotory.dart';
import 'package:qauuni/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/route.dart';

class AuthViewModel with ChangeNotifier {
  bool _loginloading = false;
  bool get loginloading => _loginloading;

  setLoading(bool value) {
    _loginloading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();

    _myRepo.loginApi(data).then((response) {
      if (response["error"] == false) {
        pref.setString(
          "token",
          response['user']["token"],
        );
        setLoading(false);
        Utils.flushBarErrorMessage("Login Successfull", context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.home,
          (route) => false,
        );
      } else {
        Utils.flushBarErrorMessage(response["message"], context);
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setLoading(false);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApis(dynamic data, BuildContext context) async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    _myRepo.signUpApi(data).then((response) {
      if (kDebugMode) {
        print(response["response"].toString());
      }
      if (response["error"] == false) {
        pref.setString(
          "token",
          response['user']["token"],
        );
        setLoading(false);
        Utils.flushBarErrorMessage("User Registered Successfull", context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.home,
          (route) => false,
        );
      } else {
        Utils.flushBarErrorMessage(response["message"], context);
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
