import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../res/app_urls.dart';

class UploadItemRepository {
  final NetworkApiService _apiService = NetworkApiService();

    Future<dynamic> postUploadItemApiUrl(dynamic data,token) async {
    try {
      dynamic responce =
          await _apiService.postApiResponse(AppUrl.postUploadMyItemsApiUrl,data,true,token);
      return responce;
    } catch (e) {
      rethrow;
    }
  }
}
