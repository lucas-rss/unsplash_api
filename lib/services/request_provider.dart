import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:unsplash_api/services/i_request_provider.dart';

class RequestProvider implements IRequestProvider {
  Dio dio = Dio();

  RequestProvider() {
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }

  @override
  Future getAsync(String url) async {
    Response? response;

    try {
      response = await dio.get(url);
    } on DioError catch (e) {
      log(e.toString());
    }

    return response;
  }
}
