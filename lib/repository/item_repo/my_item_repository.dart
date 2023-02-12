import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../model/get_not_found_items.dart';
import '../../res/app_urls.dart';

class MyItemRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<GetNotFound> getMyItemApiUrl(token) async {
    try {
      dynamic responce = await _apiService.getApiResponse(
          AppUrl.getMyItemsApiUrl, true,token,null);

      return responce = GetNotFound.fromJson(responce);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> markFoundMyItems(token) async {
    try {
      dynamic responce =
          await _apiService.postApiResponse(AppUrl.postMarkMyItemsApiUrl, null,true,token);

      return responce = GetNotFound.fromJson(responce);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
