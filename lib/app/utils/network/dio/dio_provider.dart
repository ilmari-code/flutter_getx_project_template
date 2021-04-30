import 'package:dio/dio.dart';

abstract class DioProvider {
  List<Interceptor> provideInterceptors();
  Transformer provideTransformer();
  HttpClientAdapter provideClientAdapter();
}

