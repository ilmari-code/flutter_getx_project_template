/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-30 08:56:41
 * @LastEditors: ilmari
 * @LastEditTime: 2021-06-11 08:41:24
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';
import 'package:flutter_getx_project_template/app/modules/home/service/api.dart';
import 'package:flutter_getx_project_template/app/utils/network/async_task.dart';
import 'package:flutter_getx_project_template/app/utils/network/http_utils.dart';
import 'package:get/get.dart';

class HomeService {
  static Future<ResultEntity<UserInfoEntity>> getUserInfo() {
    return HttpUtils().get<UserInfoEntity>(HomeApi.userInfo);
  }
}

class Controller {
  var count = 0.obs;

  void increment() {
    count++;
  }
}
