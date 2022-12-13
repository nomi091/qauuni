import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../model/get_not_found_items.dart';
import '../res/app_urls.dart';

class FoundItemRepository {
  final BaseApiService _apiService = NetworkApisService();

    Future<GetNotFound> getFoundItemApiUrl() async {
    try {
      dynamic responce =
          await _apiService.getGetApiReponce(AppUrl.getFoundItemsApiUrl,);
      return responce=GetNotFound.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
}
