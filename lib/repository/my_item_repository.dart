import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../model/get_not_found_items.dart';
import '../res/app_urls.dart';

class MyItemRepository {
  final BaseApiService _apiService = NetworkApisService();

  Future<GetNotFound> getMyItemApiUrl(data) async {
    try {
      dynamic responce = await _apiService.postApiReponceMyItemData(
          AppUrl.getMyItemsApiUrl, data);

      return responce = GetNotFound.fromJson(responce);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> markFoundMyItems(data) async {
    try {
      dynamic responce =
          await _apiService.postApiReponce(AppUrl.postMarkMyItemsApiUrl, data);

      return responce = GetNotFound.fromJson(responce);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
