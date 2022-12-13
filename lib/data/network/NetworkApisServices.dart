import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:qauuni/data/app_exception.dart';
import 'package:qauuni/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApisService extends BaseApiService {
  //Get Request
  @override
  Future<dynamic> getGetApiReponce(String url) async {
    dynamic responceJson;
    try {
      final responce =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responceJson = returnResponce(responce);
      // print(responce);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responceJson;
  }

  @override
  Future<dynamic> postApiReponce(String url, dynamic data) async {
    dynamic responceJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));
      responceJson = returnResponce(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responceJson;
  }

  //Post Request for Bus Route Data

  @override
  Future<dynamic> postApiReponceBusRouteData(String url, dynamic data) async {
    dynamic responceJson;
    try {
      Response response = await http
          .post(
            Uri.parse("$url?shift_id=$data"),
          )
          .timeout(const Duration(seconds: 20));
      responceJson = returnResponce(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responceJson;
  }

//Get My Items Data
  @override
  Future<dynamic> postApiReponceMyItemData(String url, dynamic data) async {
    dynamic responceJson;

    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(<String, String>{
              'user_id': data.toString(),
            }),
          )
          .timeout(const Duration(seconds: 20));
      responceJson = returnResponce(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responceJson;
  }
//Mark Found Item

  dynamic returnResponce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responceJson = jsonDecode(response.body);
        print(responceJson.toString());

        return responceJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        print(response.body.toString());
    }
  }
}
