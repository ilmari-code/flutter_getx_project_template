/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-18 09:34:08
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 09:36:00
 */
import 'package:flutter_getx_project_template/app/modules/login/login_binding.dart';
import 'package:flutter_getx_project_template/app/modules/login/login_page.dart';
import 'package:get/get.dart';

class LoginRoute {
  static String login = '/login';

  static final pages = [
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding())
  ];
}
