/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-26 10:21:37
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 15:59:43
 */

import 'package:flutter_getx_project_template/app/utils/network/dio/state.dart';

import '../task_type.dart';

class ResultEntity<T> {
  TaskResult? result; //网络请求结果
  Map? responseDataMap; //response的data值
  late String code; //response中data返回的code
  late String msg; //response中data返回的msg
  /// response中data返回的data  只有当result是 success并且 进行了解析后 才会有值
  T? data;
  Map<String, dynamic>? extraData; //请求接口的添加的额外参数 ,不参与请求接口

  ResultEntity(this.result, {this.responseDataMap, this.extraData}) {
    this.code = NetWorkResponse.getCode(responseDataMap);
    this.msg = NetWorkResponse.getMsg(responseDataMap);
  }

  bool isSuccess() {
    return (result == TaskResult.success);
  }
}
