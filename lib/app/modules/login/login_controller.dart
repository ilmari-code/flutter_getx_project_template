/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-18 09:32:18
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:17:04
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/routes/app_routes.dart';
import 'package:flutter_getx_project_template/app/routes/utils/get_navigator.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';
import 'package:flutter_getx_project_template/app/utils/sp_utils/sp_utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isCanClickLogin = false.obs;
  @override
  void onInit() {
    super.onInit();
    accountController.addListener(() {
      isCanClickLogin.value = (accountController.text.isNotEmpty &&
              passwordController.text.isNotEmpty)
          ? true
          : false;
    });
    passwordController.addListener(() {
      isCanClickLogin.value = (accountController.text.isNotEmpty &&
              passwordController.text.isNotEmpty)
          ? true
          : false;
    });
  }

  void clickLogin() {
    final account = accountController.text;
    final password = passwordController.text;
    Log.info(account);
    Log.info(password);
    SpUtils.put('isLogin', true)
        .then((value) => NavigatorUtils.offNamed(AppRoutes.main));
  }

  @override
  void onClose() {
    super.onClose();
    accountController.dispose();
    passwordController.dispose();
  }
}
