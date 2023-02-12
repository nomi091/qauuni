import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../../model/get_not_found_items.dart';
import '../../../res/app_urls.dart';

class NotFoundItemRepository {
  final NetworkApiService _apiService = NetworkApiService();

    Future<GetNotFound> getNotFoundItemApiUrl() async {
    try {
      dynamic responce =
          await _apiService.getApiResponse(AppUrl.getNotFoundItemsApiUrl,false,null,null);
      return responce=GetNotFound.fromJson(responce);
    } catch (e) {
      rethrow;
    }
  }
}
