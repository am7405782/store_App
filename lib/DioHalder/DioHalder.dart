import 'package:dio/dio.dart';

class dioHalder {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Content-Type': "application/json",
      'Authorization': token,
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response<dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio?.options.headers = {
      "lang": lang,
      'Content-Type': "application/json",
      'Authorization': token,
    };
    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio!.options.headers = {
      "lang": lang,
      'Content-Type': "application/json",
      'Authorization': token,
    };
    return await dio!.put(url, data: data, queryParameters: query);
  }

  static Future<Response> DeletData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio!.options.headers = {
      "lang": lang,
      'Content-Type': "application/json",
      'Authorization': token,
    };
    return await dio!.delete(url, queryParameters: query, data: data);
  }
}
