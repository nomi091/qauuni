import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../model/bus_route_data.dart';
import '../../res/app_urls.dart';

class RouteData {
  final NetworkApiService _apiService = NetworkApiService();

  Future<BusRouteData> getRoutePointDataApiUrl(dynamic data) async {
    try {
      dynamic responce = await _apiService.getApiResponse(
          '${AppUrl.getBusPointRouteApiUrl}?shift_id=$data', false,null,null);
      return responce = BusRouteData.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
}
