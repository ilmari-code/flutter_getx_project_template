/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-30 09:01:01
 */
import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';
import 'package:flutter_getx_project_template/app/modules/home/service/service.dart';
import 'package:flutter_getx_project_template/app/utils/network/task_type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<UserInfoEntity> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    HomeService.getUserInfo().then((value) {
      switch (value.result) {
        case TaskResult.success:
          change(value.data, status: RxStatus.success());
          break;
        default:
          change(null, status: RxStatus.error());
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
