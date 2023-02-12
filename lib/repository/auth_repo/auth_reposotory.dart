import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../../res/app_urls.dart';

class AuthRepository {
  final NetworkApiService _apiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responce =
          await _apiService.postApiResponse(
            AppUrl.loginApiUrl, data,false,null
          );
      return responce;
      // return responce;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic responce =
          await _apiService.postApiResponse(AppUrl.registerApiUrl, data,false,null);
      return responce;
    } catch (e) {
      rethrow;
    }
  }

}
