import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';

enum NetWorkMethod { Get, Post, Delete, Put, Head, Patch }

class NetWorkMethodUtils {
  static String getNetWorkMethod(NetWorkMethod method) {
    switch (method) {
      case NetWorkMethod.Get:
        return "GET";
      case NetWorkMethod.Post:
        return "POST";
      case NetWorkMethod.Delete:
        return "DELETE";
      case NetWorkMethod.Put:
        return "PUT";
      case NetWorkMethod.Head:
        return "HEAD";
      case NetWorkMethod.Patch:
        return "PATCH";
      default:
        return 'GET';
    }
  }
}

class NetWorkCacheSetting {
  static const int CacheTime = 1; // 直接获取缓存Info时间（毫秒） ----- 跳过网络请求
  static const int SaveTime = 7; // 数据库存储时间(天)
}

// 接口返回信息
class NetWorkResponse {
  static const String _Code = "code";
  static const String _Msg = "msg";
  static const String _Data = "data";

  static String getCode(Map? map) {
    if (map == null || !map.containsKey(_Code)) return "";
    return map[_Code].toString();
  }

  static String getMsg(Map? map) {
    if (map == null || !map.containsKey(_Msg)) return "";
    return map[_Msg].toString();
  }

  static getData(Map? map) {
    if (map == null || !map.containsKey(_Data)) return null;
    return map[_Data];
  }

  static Map? parseResponseData(Response? response) {
    if (response != null && response.data != null) {
      try {
        String jsonString = json.encode(response.data);
        Map resultMap = jsonDecode(jsonString);
        return resultMap;
      } catch (exception, stack) {
        Log.warning(exception.toString(), exception, stack, false);
        return null;
      }
    }
    return null;
  }
}

// 链接状态
class NetWorkState {
  static const int Success = 200;
  static const int TokenTimeout = 401; // token失效 --- 时间 / 服务器重启 。。。

  static bool isSuccess(int? code) {
    return (Success == code);
  }

  static bool isTokenTimeout(int? code) {
    return (TokenTimeout == code);
  }
}

// 接口状态
class ApiState {
  static const String Success = "0";

  static bool isSuccess(String code) {
    return (Success == code);
  }
}

/// token 在服务器重启时可能一直处于过期（401）状态 --- 避免循环刷新而锁死
class TokenCounter {
  static int _maxTime = 2; // token至多刷新次数
  static int _tokenRefreshCounter = 0; // token刷新计数,,

  static void refreshCounter() {
    _tokenRefreshCounter = 0;
  }

  static void addCounter() {
    _tokenRefreshCounter++;
  }

  static bool counterIsMax() {
    if (_tokenRefreshCounter < _maxTime) {
      return false;
    }
    // refreshCounter();
    return true;
  }
}
