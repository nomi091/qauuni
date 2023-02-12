import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../model/shift_data_model.dart';
import '../../res/app_urls.dart';

class ShiftRepository {
  final NetworkApiService _apiService = NetworkApiService();

    Future<ShiftData> getBusPointDataApiUrl() async {
    try {
      dynamic responce =
          await _apiService.getApiResponse(AppUrl.getBusPointApiUrl,false,null,null);
      return responce=ShiftData.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
}
