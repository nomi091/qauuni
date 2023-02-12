

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qauuni/data/app_exception.dart';

class NetworkApiService {
  @override
  Future getApiResponse(String url, bool tokentrue, String? token,
      dynamic queryParameters) async {
    dynamic responceJson;
    try {
      if (kDebugMode) {
        print('In Dio in try');
        print(url);
        print(tokentrue.toString());
        print(token.toString());
        print('In Dio in try');
      }
      Dio dio = Dio();
      if (tokentrue == true) {
        // dio.options.headers['Accept'] = 'application/json';
        dio.options.headers["Authorization"] = "Bearer $token";
        dio.options.headers['Content'] = 'application/json';
      } else {
        dio.options.headers['Content'] = 'application/json';
      }
      Response responce = await dio
          .get(url, queryParameters: queryParameters)
          .timeout(const Duration(seconds: 20));
      BaseOptions(validateStatus: (statusCode) {
        if (statusCode == 422) {
          return true;
        }
        if (statusCode == 200) {
          return true;
        }
        return false;
      });

      responceJson = returnResponce(responce);
      debugPrint(responce.statusCode.toString());
    } on DioError catch (e) {
      returnExceptionError(e);
    }
    return responceJson;
  }

  @override
  Future postApiResponse(
      String url, dynamic data, bool tokentrue, String? token) async {
    dynamic responceJson;
    try {
      // print('here 222');
      if (kDebugMode) {
        print('In Dio in try');
        print(url);
        print(data.toString());
        print(tokentrue.toString());
        print(token.toString());
        print('In Dio in try');
      }
      Dio dio = Dio(BaseOptions(validateStatus: (statusCode) {
        if (statusCode == 422) {
          return true;
        }
        if (statusCode == 200) {
          return true;
        }
        return false;
      }));
      if (tokentrue == true) {
        // dio.options.headers['content-Type'] = 'application/json';
        // dio.options.headers['Accept'] = 'application/json';
        dio.options.headers["authorization"] = "Bearer $token";
      } else {
        dio.options.headers['Accept'] = 'application/json';
      }
      // print('responceJson.toString()');
      Response responce = await dio
          .post(
            url,
            data: data,
          )
          .timeout(const Duration(seconds: 20));

      debugPrint('.toString()');
      responceJson = returnResponce(responce);
      debugPrint(responce.toString());
    } on DioError catch (e) {
      returnExceptionError(e);
    }

    return responceJson;
  }

  /// Put Api response
  ///
  @override
  Future putApiResponse(
      String url, dynamic data, bool tokentrue, String? token) async {
    dynamic responceJson;
    try {
      print('here 222');
      if (kDebugMode) {
        print('In Dio in try');
        print(url);
        print(data.toString());
        print(tokentrue.toString());
        print(token.toString());
        print('In Dio in try');
      }
      print(token);
      Dio dio = Dio();
      if (tokentrue == true) {
        dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers["access-token"] = "$token";
      } else {
        dio.options.headers['Accept'] = 'application/json';
      }
      print(url);
      Response responce = await dio
          .put(
            url,
            data: data,
          )
          .timeout(const Duration(seconds: 20));
      debugPrint('.toString()');
      responceJson = returnResponce(responce);

      debugPrint(responce.toString());
    } on DioError catch (e) {
      returnExceptionError(e);
    }
    return responceJson;
  }

  /// delete Api response
  ///
  @override
  Future deleteApiResponse(String url, String? token) async {
    dynamic responceJson;
    try {
      if (kDebugMode) {
        print('In Dio in Delete Api responce');
        print(url);
        print(token.toString());
        print('In Dio in Delete Api responce');
      }
      Dio dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      Response responce =
          await dio.delete(url).timeout(const Duration(seconds: 20));

      responceJson = returnResponce(responce);
    } on DioError catch (e) {
      returnExceptionError(e);
    }
    return responceJson;
  }

  dynamic returnResponce(Response responce) {
    switch (responce.statusCode) {
      case 200:
        dynamic responceJson = jsonDecode(responce.toString());
        return responceJson;
      case 422:
        dynamic responceJson = jsonDecode(responce.toString());
        return responceJson;
    }
  }

  dynamic returnExceptionError(e) {
    if (kDebugMode) {
      print('e.toString() e.toString()111111111');
      print(e.response!.statusCode.toString());
      print(e.toString());
    }
    if (e.isNoConnectionError) {
      throw FetchDataException('No Internet Conection');
    } else if (e.response!.statusCode == 422) {
      dynamic responceJson = jsonDecode(e.responce.toString());
      return responceJson;
    } else if (e.response!.data['message'] == 500) {
      throw FetchDataException('');
    } else {
      throw FetchDataException('${e.response!.statusCode}');
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
      error is SocketException; // import 'dart:io' for SocketException
}
