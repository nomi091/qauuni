import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../model/bus_route_data.dart';
import '../res/app_urls.dart';

class RouteData {
  final BaseApiService _apiService = NetworkApisService();

  Future<BusRouteData> getRoutePointDataApiUrl(dynamic data) async {
    try {
      dynamic responce = await _apiService.postApiReponceBusRouteData(
          AppUrl.getBusPointRouteApiUrl, data);
      return responce = BusRouteData.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
  //https://qiu.globalasias.com/api/getRouteData
}
