/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-18 09:32:09
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 09:33:28
 */
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
