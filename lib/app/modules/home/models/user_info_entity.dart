import 'package:flutter_getx_project_template/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
  String? account;
  String? phone;
  String? username;
  String? avatar;
  String? id;
}
