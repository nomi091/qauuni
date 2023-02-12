import 'package:flutter/foundation.dart';
import 'package:qauuni/repository/item_repo/upload_item_repo.dart';
import 'package:qauuni/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadItemViewModel with ChangeNotifier {
  final _myRepo = UploadItemRepository();
  bool _uploadloading = false;
  bool get uploadLoding => _uploadloading;

  setLoading(bool value) {
    _uploadloading = value;
    notifyListeners();
  }

  Future<void> uploadItemApis({dynamic data, context}) async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    _myRepo.postUploadItemApiUrl(data, token).then((value) {
      //  Utils.flushBarErrorMessage("Login Successfull", context);

      if (value['error'] == false) {
        Utils.flushBarErrorMessage(value['message'].toString(), context);
        setLoading(false);
      } else {
        Utils.flushBarErrorMessage('Error While uploading', context);
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
        setLoading(false);
      }
    });
  }
}
