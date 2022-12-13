import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';
import 'package:qauuni/model/get_not_found_items.dart';
import '../repository/found_item_repository.dart';

class FoundItemsViewModel with ChangeNotifier {
  final _myRepo =FoundItemRepository();
  
 ApiResponce<GetNotFound> founditemData = ApiResponce.lodaing();
  setitemData(ApiResponce<GetNotFound> responce) {
    founditemData = responce;
    notifyListeners();
  }

  

  Future<void> getFoundItemData() async {
    setitemData(ApiResponce.lodaing());
    _myRepo.getFoundItemApiUrl().then((responce) {
      
      setitemData(ApiResponce.completed(responce));

    }).onError((error, stackTrace) {
      setitemData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}
