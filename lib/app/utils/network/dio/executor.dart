import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';

import '../async_task.dart';
import '../task_type.dart';

class NetWorkExecutor {
  Future<ResultEntity> request(Dio dio, NetCallSetting callSetting) async {
    try {
      Response response = await dio.request(callSetting.url,
          data: callSetting.param,
          queryParameters: callSetting.queryParameters,
          options: callSetting.options,
          onReceiveProgress: callSetting.onReceiveProgress,
          onSendProgress: callSetting.onSendProgress,
          cancelToken: callSetting.cancelToken);

      if ((callSetting.cacheData) && callSetting.cacheCallback != null) {
        //todo 去除dioHttpCache

        callSetting.cacheCallback?.onCacheCallBack(false);
        // //缓存数据
        // if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        //   callSetting.cacheCallback.onCacheCallBack(true);
        // } else {
        //   callSetting.cacheCallback.onCacheCallBack(false);
        // }
      }

      // 返回值异常
      if (response == null) {
        // Log.finest(" ----- ResponseError ----- ");
        return handleError(TaskResult.error, response, callSetting);
      }

      // token失效
      if (NetWorkState.isTokenTimeout(response.statusCode ?? 0)) {
        return handleError(TaskResult.tokenTimeout, response, callSetting);
      }

      // 接口调用成功
      if (NetWorkState.isSuccess(response.statusCode ?? 0)) {
        return handleSuccess(response, callSetting);
      } else {
        // 接口调用失败
        return handleError(TaskResult.error, response, callSetting);
      }
    } catch (exception, stack) {
      Log.warning(exception.toString(), exception, stack, false);
      // Log.finest("Exception --- $exception");
      if (exception is DioError && exception.error == TaskResult.tokenTimeout) {
        // token失效
        return handleError(
            TaskResult.tokenTimeout, exception.response, callSetting);
      } else {
        // 网络请求异常
        if (exception is DioError) {
          return handleError(TaskResult.error, exception.response, callSetting);
        } else {
          return handleError(TaskResult.error, null, callSetting);
        }
      }
    }
  }

  Future<ResultEntity> download<T>(Dio dio, NetCallSetting callSetting) async {
    try {
      Response response = await dio.download(
          callSetting.url, callSetting.savePath,
          data: callSetting.param,
          queryParameters: callSetting.queryParameters,
          options: callSetting.options,
          deleteOnError: callSetting.deleteOnError,
          lengthHeader: callSetting.lengthHeader,
          onReceiveProgress: callSetting.onReceiveProgress,
          cancelToken: callSetting.cancelToken);

      if (callSetting.cacheData && callSetting.cacheCallback != null) {
        //todo 去除dioHttpCache
        callSetting.cacheCallback?.onCacheCallBack(false);
        // //缓存数据
        // if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        //   callSetting.cacheCallback.onCacheCallBack(true);
        // } else {
        //   callSetting.cacheCallback.onCacheCallBack(false);
        // }
      }

      // 返回值异常
      if (response == null) {
        // Log.finest(" ----- ResponseError ----- ");
        return handleError(TaskResult.error, response, callSetting);
      }

      // token失效
      if (NetWorkState.isTokenTimeout(response.statusCode)) {
        return handleError(TaskResult.tokenTimeout, response, callSetting);
      }

      // 接口调用成功
      if (NetWorkState.isSuccess(response.statusCode)) {
        return handleSuccess(response, callSetting);
      } else {
        // 接口调用失败
        return handleError(TaskResult.error, response, callSetting);
      }
    } catch (exception, stack) {
      Log.warning(exception.toString(), exception, stack, false);
      // Log.finest("Exception --- $exception");
      if (exception is DioError && exception.error == TaskResult.tokenTimeout) {
        // token失效
        return handleError(
            TaskResult.tokenTimeout, exception.response, callSetting);
      } else {
        // 网络请求异常
        if (exception is DioError) {
          return handleError(TaskResult.error, exception.response, callSetting);
        } else {
          return handleError(TaskResult.error, null, callSetting);
        }
      }
    }
  }

  // 成功回调
  ResultEntity handleSuccess(Response response, NetCallSetting callSetting) {
    Map? responseDataMap = NetWorkResponse.parseResponseData(response);
    // 接口返回
    if (ApiState.isSuccess(NetWorkResponse.getCode(responseDataMap))) {
      // 成功回调
      callSetting.callback?.onNetWorkCallback(
          TaskResult.success,
          NetWorkResponse.getMsg(responseDataMap),
          responseDataMap,
          callSetting.extraData);
      return ResultEntity(
        TaskResult.success,
        extraData: callSetting.extraData,
        responseDataMap: responseDataMap,
      );
    } else {
      // 失败信息处理
      // Log.finest(" ----- ApiFail ----- ");
      return handleError(TaskResult.fail, response, callSetting);
    }
  }

  // 失败回调
  ResultEntity handleError(
      TaskResult result, Response? response, NetCallSetting callSetting) {
    Map? dataMap = NetWorkResponse.parseResponseData(response);
    String msg = NetWorkResponse.getMsg(dataMap);
    if (msg.isEmpty) {
      switch (result) {
        case TaskResult.error:
          msg = "网络错误!";
          break;
        case TaskResult.tokenTimeout:
          msg = "登录失效!";
          break;
        default:
          msg = "网络错误!";
          break;
      }
    }
    if (callSetting.callback != null) {
      callSetting.callback!
          .onNetWorkCallback(result, msg, dataMap, callSetting.extraData);
    }
    return ResultEntity(
      result,
      extraData: callSetting.extraData,
      responseDataMap: dataMap,
    );
  }
}
