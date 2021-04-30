/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-30 08:56:41
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-30 08:59:55
 */
import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';
import 'package:flutter_getx_project_template/app/modules/home/service/api.dart';
import 'package:flutter_getx_project_template/app/utils/network/async_task.dart';
import 'package:flutter_getx_project_template/app/utils/network/http_utils.dart';

class HomeService {
  static Future<ResultEntity<UserInfoEntity>> getUserInfo() {
    return HttpUtils().get<UserInfoEntity>(HomeApi.userInfo);
  }
}
