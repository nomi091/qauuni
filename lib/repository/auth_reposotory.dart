import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:qauuni/data/network/NetworkApisServices.dart';
import '../res/app_urls.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApisService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responce =
          await _apiService.postApiReponce(AppUrl.loginApiUrl, data);

      return responce;

      // return responce;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic responce =
          await _apiService.postApiReponce(AppUrl.registerApiUrl, data);
      return responce;
    } catch (e) {
      rethrow;
    }
  }

}
