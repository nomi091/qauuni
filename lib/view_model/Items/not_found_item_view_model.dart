import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';
import 'package:qauuni/model/get_not_found_items.dart';
import '../../repository/item_repo/not_found_item_repository.dart';

class NotFoundItemsViewModel with ChangeNotifier {
  final _myRepo = NotFoundItemRepository();
  
  ApiResponce<GetNotFound> itemData = ApiResponce.lodaing();
  setitemData(ApiResponce<GetNotFound> responce) {
    itemData = responce;
    notifyListeners();
  }

  Future<void> getNotFoundItemData() async {
    setitemData(ApiResponce.lodaing());

    _myRepo.getNotFoundItemApiUrl().then((responce) {
      
      setitemData(ApiResponce.completed(responce));

    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}