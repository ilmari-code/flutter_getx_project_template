import 'package:dio/dio.dart';
import 'package:flutter_getx_project_template/app/utils/network/task_type.dart';
import 'package:flutter_getx_project_template/app/utils/toast/toast.dart';

import 'callback.dart';
import 'state.dart';

class NetCallSetting {
  final String url; //请求地址
  Object? param; //请求参数
  Map<String, dynamic>? queryParameters; //请求参数
  NetWorkMethod method = NetWorkMethod.Post; //请求方式

  Options? options; //请求配置
  final CancelToken? cancelToken; //可用于取消请求的token，多个请求可用同一个，取消时会将同一token的请求都取消
  ProgressCallback? onSendProgress; //用于监听上传进度
  ProgressCallback? onReceiveProgress; //用于监听下载进度

  NetWorkCallback? callback; //请求回调

  bool cacheData = false; //是否缓存数据，true 开启缓存后默认 1毫秒内直接使用缓存 7天内先使用网络在使用缓存
  NetWorkCacheCallback? cacheCallback; //获取缓存的回调

  Map<String, dynamic>? extraData;

  //关于download下载时 使用
  String? _savePath;
  bool _deleteOnError = true;
  String _lengthHeader = Headers.contentLengthHeader;

  String get savePath => _savePath.nullSafe;

  bool get deleteOnError => _deleteOnError;

  String get lengthHeader => _lengthHeader;

  NetCallSetting.get(this.url,
      {Map<String, dynamic>? param,
      NetWorkCallback? callback,
      this.cancelToken,
      Options? options,
      this.cacheData = false,
      this.cacheCallback,
      this.onReceiveProgress,
      this.extraData}) {
    method = NetWorkMethod.Get;
    this.queryParameters = param;
    //判断是否包含缓存配置
    this.options = _initCallOptions(options);
    if (callback == null) {
      this.callback = DefaultNetWorkCallBack(true);
    } else {
      this.callback = callback;
    }
  }

  NetCallSetting.notGet(this.url, this.method,
      {this.param,
      this.queryParameters,
      this.callback,
      this.cancelToken,
      Options? options,
      this.cacheData = false,
      this.cacheCallback,
      this.onReceiveProgress,
      this.onSendProgress,
      this.extraData}) {
    //判断是否包含缓存配置
    this.options = _initCallOptions(options);

    if (callback == null) {
      this.callback = DefaultNetWorkCallBack(true);
    } else {
      this.callback = callback;
    }
  }

  NetCallSetting.downLoad(this.url, String savePath,
      {this.param,
      this.queryParameters,
      this.callback,
      this.cancelToken,
      this.options,
      this.onReceiveProgress,
      bool? deleteOnError,
      String? lengthHeader,
      this.extraData}) {
    this._savePath = savePath;
    this._deleteOnError = deleteOnError ?? false;
    this._lengthHeader = lengthHeader.nullSafe;
    if (callback == null) {
      this.callback = DefaultNetWorkCallBack(true);
    } else {
      this.callback = callback;
    }
  }

  Options _initCallOptions(Options? options) {
    Options newOptions;
    if (options == null) {
      newOptions = Options(method: NetWorkMethodUtils.getNetWorkMethod(method));
    } else {
      newOptions = options;
    }
    //todo 去除dioHttpCache

    // if (cacheData &&
    //     options.responseType != ResponseType.stream &&
    //     !(options.extra.containsKey(DIO_CACHE_KEY_TRY_CACHE) &&
    //         options.extra[DIO_CACHE_KEY_TRY_CACHE])) {
    //   // 未设置缓存配置 --- 使用默认值
    //   newOptions = buildCacheOptions(Duration(milliseconds: 1),
    //       maxStale: Duration(days: NetWorkCacheSetting.SaveTime),
    //       options: options);
    // }
    if (newOptions.method?.isEmpty ?? true) {
      newOptions.method = NetWorkMethodUtils.getNetWorkMethod(method);
    }
    return newOptions;
  }
}

class DefaultNetWorkCallBack extends NetWorkCallback {
  final bool showToast;

  DefaultNetWorkCallBack(this.showToast);

  @override
  void onNetWorkCallback(TaskResult result, String msg,
      Map<dynamic, dynamic>? response, Map<String, dynamic>? extraData) {
    if (result != TaskResult.success && showToast) {
      try {
        Toast.show(msg);
      } catch (e) {}
    }
  }
}

extension StringExtension on String? {
  String get nullSafe => this ?? "";
}
