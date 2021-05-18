/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:19:05
 */
import 'package:flutter_getx_project_template/app/routes/login_route.dart';
import 'package:flutter_getx_project_template/app/routes/utils/get_navigator.dart';
import 'package:flutter_getx_project_template/app/utils/sp_utils/sp_utils.dart';
import 'package:get/get.dart';

class MineController extends GetxController {
  final count = 0.obs;
  List titleList = ['设置', '退出登录'];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logOut() {
    SpUtils.remove('isLogin')
        .then((value) => NavigatorUtils.offAllNamed(LoginRoute.login));
  }
}
