import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'dio/call_setting.dart';
import 'dio/dio_creator.dart';
import 'dio/dio_provider.dart';
import 'dio/executor.dart';
import 'dio/result_entity.dart';
import 'dio/transformer.dart';

class NetWork implements DioProvider {
  static final NetWork _instance = NetWork._();

  NetWork._();

  factory NetWork() {
    return _instance;
  }
  final NetWorkExecutor executor = NetWorkExecutor();

  DioCreator? creator;

  Dio? _globalDio;
  Dio? _tokenDio;

  String? _refreshApi;
  Function? refreshErrorCallBack;
  String? networkBasicId;

  void init(String host, String networkBasicId,
      {String? refreshApi, Function? refreshErrorCallBack}) {
    this._refreshApi = refreshApi.nullSafe;
    this.networkBasicId = networkBasicId;
    this.refreshErrorCallBack = refreshErrorCallBack?.call();

    creator = DioCreator(host);
    _globalDio = creator?.custom(this);
  }

  Future<ResultEntity>? request({@required NetCallSetting? callSetting}) async {
    if (_globalDio == null) {
      throw Exception("需先调用init 方法");
    }
    if (callSetting != null) {
      return await executor.request(_globalDio!, callSetting);
    }
    return await executor.request(_globalDio!, callSetting!);
  }

  Future<ResultEntity> download({@required NetCallSetting? callSetting}) async {
    if (_globalDio == null) {
      throw Exception("需先调用init 方法");
    }
    return await executor.download(_globalDio!, callSetting!);
  }

  //只用来请求刷新token的
  Future<ResultEntity> requestRefreshToken(
      {@required NetCallSetting? callSetting}) async {
    if (_tokenDio == null) _tokenDio = null;
    return await executor.request(
      _tokenDio!,
      callSetting!,
    );
  }

//"${Api.login}?grant_type=refresh_token&refresh_token=$refreshToken"
  // @override
  // List<Interceptor> provideInterceptors() {
  //   if (this._refreshApi.isNotEmpty) {
  //     return [
  //       TokenInterceptor(
  //           refreshTokenFunction: (
  //             String refreshToken, {
  //             Options? options,
  //           }) async {
  //             TokenEntity token = await AccountManager.getUser();
  //             NetCallSetting setting = NetCallSetting.notGet(
  //                 _refreshApi, NetWorkMethod.Post,
  //                 queryParameters: {"refresh_token": token?.refresh_token},
  //                 options: options);
  //             ResultEntity entity =
  //                 await requestRefreshToken(callSetting: setting);
  //             TokenEntity data;
  //             if (entity.isSuccess()) {
  //               try {
  //                 data = TokenEntity().fromJson(
  //                     NetWorkResponse.getData(entity.responseDataMap));
  //               } catch (e) {}
  //               if (data.access_token?.isEmpty ?? true) {
  //                 data = null;
  //               }
  //             }
  //             if (data == null && refreshErrorCallBack != null) {
  //               refreshErrorCallBack();
  //             }

  //             return data;
  //           },
  //           networkBasicId: networkBasicId)
  //     ];
  //   } else {
  //     return [TokenInterceptor(refreshTokenFunction: null)];
  //   }
  // }

  @override
  Transformer provideTransformer() {
    return CustomTransformer();
  }

  @override
  HttpClientAdapter provideClientAdapter() {
    return DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) {
          return true;
        };
        client.findProxy = (uri) {
          return 'DIRECT';
        };
      };
  }

  @override
  List<Interceptor> provideInterceptors() {
    // TODO: implement provideInterceptors
    return [];
  }

  // Dio get globalDio {
  //   return _globalDio;
  // }

}
