/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 15:19:42
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 17:45:45
 */
import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';

userInfoEntityFromJson(UserInfoEntity data, Map<String, dynamic> json) {
  if (json['account'] != null) {
    data.account = json['account'].toString();
  }
  if (json['phone'] != null) {
    data.phone = json['phone'].toString();
  }
  if (json['username'] != null) {
    data.username = json['username'].toString();
  }
  if (json['avatar'] != null) {
    data.avatar = json['avatar'].toString();
  }
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  return data;
}

Map<String, dynamic> userInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['account'] = entity.account;
  data['phone'] = entity.phone;
  data['username'] = entity.username;
  data['avatar'] = entity.avatar;
  data['id'] = entity.id;
  return data;
}
