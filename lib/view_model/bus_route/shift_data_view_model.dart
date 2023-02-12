import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';

import '../../model/shift_data_model.dart';
import '../../repository/bus_repo/shift_data_reposotory.dart';

class ShiftDataViewModel with ChangeNotifier {
  final _myRepo = ShiftRepository();
  
  ApiResponce<ShiftData> shiftData = ApiResponce.lodaing();
  setshiftData(ApiResponce<ShiftData> responce) {
    shiftData = responce;
    notifyListeners();
  }

  Future<void> getBusShit() async {
    setshiftData(ApiResponce.lodaing());
    _myRepo.getBusPointDataApiUrl().then((responce) {
      
      setshiftData(ApiResponce.completed(responce));

    }).onError((error, stackTrace) {
      setshiftData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
