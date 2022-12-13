import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';
import 'package:qauuni/model/get_not_found_items.dart';
import '../repository/my_item_repository.dart';
import '../repository/not_found_item_repository.dart';

class MyItemsViewModel with ChangeNotifier {
  final _myRepo = MyItemRepository();

  ApiResponce<GetNotFound> myitemData = ApiResponce.lodaing();
  setitemData(ApiResponce<GetNotFound> responce) {
    myitemData = responce;
    notifyListeners();
  }

  Future<void> myItemData(dynamic data) async {
    setitemData(ApiResponce.lodaing());
    _myRepo.getMyItemApiUrl(data).then((responce) {
      setitemData(ApiResponce.completed(responce));
    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> markFoundMyItem(dynamic data) async {
    setitemData(ApiResponce.lodaing());
    _myRepo.getMyItemApiUrl(data).then((responce) {
      setitemData(ApiResponce.completed(responce));
    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
