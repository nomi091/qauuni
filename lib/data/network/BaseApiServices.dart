// ignore: file_names
abstract class BaseApiService {
  Future<dynamic> getGetApiReponce(String url);
  Future<dynamic> postApiReponce(String url, dynamic data);
  Future<dynamic> postApiReponceBusRouteData(String url, dynamic data);
  Future<dynamic> postApiReponceMyItemData(String url, dynamic data);
  // Future<dynamic>getNotFoundItemsData(String url);
}
