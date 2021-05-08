/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 15:42:27
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-07 09:41:39
 */
import 'package:flutter_getx_project_template/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
  String? account;
  String? phone;
  String? username;
  String? avatar;
  String? id;
}
