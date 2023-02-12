import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';
import 'package:qauuni/model/get_not_found_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/item_repo/my_item_repository.dart';

class MyItemsViewModel with ChangeNotifier {
  final _myRepo = MyItemRepository();

  ApiResponce<GetNotFound> myitemData = ApiResponce.lodaing();
  setitemData(ApiResponce<GetNotFound> responce) {
    myitemData = responce;
    notifyListeners();
  }

  Future<void> myItemData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    setitemData(ApiResponce.lodaing());
    _myRepo.getMyItemApiUrl(token).then((responce) {
      setitemData(ApiResponce.completed(responce));
    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> markFoundMyItem() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    setitemData(ApiResponce.lodaing());
    _myRepo.markFoundMyItems(token).then((responce) {
      setitemData(ApiResponce.completed(responce));
    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
