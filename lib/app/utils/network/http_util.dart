import 'dart:convert';

import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';
import 'package:flutter_getx_project_template/app/utils/network/async_task.dart';
import 'package:flutter_getx_project_template/app/utils/network/dio/callback.dart';
import 'package:flutter_getx_project_template/app/utils/network/dio/result_entity.dart';

///使用时需 去除私有 添加 调用[NetWork.init] （NetWork().init）方法
///使用时可添加 [ResultEntity]中 关于 responseDataMap 的解析
abstract class NetWorkHttpUtils {
  Future<ResultEntity<T>> get<T>(String url,
      {Map<String, dynamic>? param,
      NetWorkCallback? callback,
      Options? options,
      cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.get(url,
        param: param,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  Future<ResultEntity<T>> post<T>(String url,
      {param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.notGet(url, NetWorkMethod.Post,
        param: param,
        queryParameters: queryParameters,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  Future<ResultEntity<T>> put<T>(String url,
      {param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.notGet(url, NetWorkMethod.Put,
        param: param,
        queryParameters: queryParameters,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  Future<ResultEntity<T>> delete<T>(String url,
      {param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.notGet(url, NetWorkMethod.Delete,
        param: param,
        queryParameters: queryParameters,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  Future<ResultEntity<T>> head<T>(String url,
      {param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.notGet(url, NetWorkMethod.Head,
        param: param,
        queryParameters: queryParameters,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  Future<ResultEntity<T>> patch<T>(String url,
      {param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    return request<T>(NetCallSetting.notGet(url, NetWorkMethod.Patch,
        param: param,
        queryParameters: queryParameters,
        callback: callback,
        options: options,
        cancelToken: cancelToken,
        extraData: extraData));
  }

  T parserData<T>(Map? responseDataMap) {
    late T data;
    if (responseDataMap != null) {
      var responseData = NetWorkResponse.getData(responseDataMap);
      try {
        if (responseData != null) {
          switch (T.toString()) {
            case "dynamic":
              data = responseData as T;
              print(data);
              break;
            case "String":
              if (responseData is List) {
                data = jsonEncode(responseData) as T;
              }
              data = responseData.toString() as T;

              break;
            default:
              if (T.toString().startsWith("Map") ||
                  T.toString().startsWith("List<Map")) {
                data = responseData as T;
              } else {
                data = jsonParseData(responseData);
              }
              break;
          }
        }
      } catch (e, s) {
        Log.warning(e.toString(), e, s, false);
      }
    }
    return data;
  }

  T jsonParseData<T>(dynamic responseData);

  Future<ResultEntity<T>> request<T>(NetCallSetting callSetting) async {
    ResultEntity entity = (await NetWork().request(callSetting: callSetting))!;
    T data = parserData(entity.responseDataMap);
    ResultEntity<T> resultEntity =
        ResultEntity(entity.result, extraData: entity.extraData)
          ..msg = entity.msg
          ..code = entity.code
          ..data = data
          ..responseDataMap = entity.responseDataMap;
    return resultEntity;
  }

  Future<ResultEntity> download(String url, String savePath,
      {bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      param,
      Map<String, dynamic>? queryParameters,
      NetWorkCallback? callback,
      Options? options,
      ProgressCallback? onReceiveProgress,
      CancelToken? cancelToken,
      Map<String, dynamic>? extraData}) async {
    ResultEntity entity = await NetWork().download(
        callSetting: NetCallSetting.downLoad(url, savePath,
            deleteOnError: deleteOnError,
            lengthHeader: lengthHeader,
            param: param,
            queryParameters: queryParameters,
            callback: callback,
            cancelToken: cancelToken,
            options: options,
            onReceiveProgress: onReceiveProgress,
            extraData: extraData));
    return entity;
  }
}
