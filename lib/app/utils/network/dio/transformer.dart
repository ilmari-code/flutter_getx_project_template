
import 'package:dio/dio.dart';

class CustomTransformer extends DefaultTransformer {
  @override
  Future<String> transformRequest(RequestOptions options) {
    return super.transformRequest(options);
  }

  @override
  Future transformResponse(
      RequestOptions options, ResponseBody response) async {
    var body = await super.transformResponse(options, response);
    if (body is String) {
      // print(body);
    } else if (body is Map) {
      // print(body);
    }
    return body;
  }
}