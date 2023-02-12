import 'package:flutter/foundation.dart';
import 'package:qauuni/data/responce/api_responce.dart';
import '../../model/bus_route_data.dart';
import '../../repository/bus_repo/bus_route_data_reposotory.dart';

class BusRouteViewModel with ChangeNotifier {
  final _myRepo = RouteData();
  
  ApiResponce<BusRouteData> busRouteData = ApiResponce.lodaing();
  setRouteData(ApiResponce<BusRouteData> responce) {
    busRouteData = responce;
    notifyListeners();
  }
  Future<void> getBusRouteData(dynamic data) async {
    setRouteData(ApiResponce.lodaing());

    _myRepo.getRoutePointDataApiUrl(data).then((responce) {
      
      setRouteData(ApiResponce.completed(responce));

    }).onError((error, stackTrace) {
      setRouteData(ApiResponce.error(error.toString()));

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
