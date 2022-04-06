import 'package:dio/dio.dart';

import 'HttpResponse.dart';

abstract class HttpTransFormer {
  HttpResponse parse(Response response);
}

// 不同json 格式定制解析处理
class DefaultHttpTransFormer extends HttpTransFormer {
  @override
  HttpResponse parse(Response response) {
    return HttpResponse.success(response.data);
  }

  static DefaultHttpTransFormer _instance = DefaultHttpTransFormer._internal();

  DefaultHttpTransFormer._internal();

  factory DefaultHttpTransFormer.getInstance() => _instance;
}
