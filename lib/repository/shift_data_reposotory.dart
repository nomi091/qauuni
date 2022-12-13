import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../model/shift_data_model.dart';
import '../res/app_urls.dart';

class ShiftRepository {
  final BaseApiService _apiService = NetworkApisService();

    Future<ShiftData> getBusPointDataApiUrl() async {
    try {
      dynamic responce =
          await _apiService.getGetApiReponce(AppUrl.getBusPointApiUrl,);
      return responce=ShiftData.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
}
