/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-26 10:21:37
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 16:54:32
 */
import 'package:dio/dio.dart';
import 'package:flutter_getx_project_template/app/utils/network/dio/dio_provider.dart';
import 'package:flutter_getx_project_template/app/utils/network/inteceptor/log_inteceptor.dart';

class DioCreator {
  static const int defaultTimeOut = 15000; // 超时时间

  final String host;
  final int timeOut;

  DioCreator(this.host, {this.timeOut: defaultTimeOut});

  Dio custom(DioProvider provider, {int customTimeOut: defaultTimeOut}) {
    Dio dio = Dio(BaseOptions(baseUrl: host, connectTimeout: customTimeOut))
      ..interceptors.addAll(provider.provideInterceptors())
      ..interceptors.addAll(getDefaultInterceptor());
    Transformer transformer = provider.provideTransformer();
    dio.transformer = transformer;
    HttpClientAdapter clientAdapter = provider.provideClientAdapter();
    dio.httpClientAdapter = clientAdapter;
    return dio;
  }

  List<Interceptor> getDefaultInterceptor() {
    return [
      // 缓存拦截器
      //todo 去除dioHttpCache

      // DioCacheManager(CacheConfig(baseUrl: host)).interceptor,
      // 日志拦截器
      DefaultLogInterceptor(requestBody: true, responseBody: true)
    ];
  }
}
