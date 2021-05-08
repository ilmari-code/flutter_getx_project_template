/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:03:30
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 11:05:25
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/index/controllers/index_controller.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
import 'package:flutter_getx_project_template/app/utils/toast/toast.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IndexPage extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 0.5, color: Colors.grey))),
              child: Obx(() => BottomNavigationBar(
                    backgroundColor: Colors.white,
                    items: controller.items,
                    type: BottomNavigationBarType.shifting,
                    currentIndex: controller.tabIndex.value,
                    elevation: 0,
                    iconSize: Dimens.size24,
                    selectedFontSize: DimenFont.normal,
                    unselectedFontSize: DimenFont.normal,
                    selectedItemColor: ResourceColors.color_08B16B,
                    unselectedItemColor: ResourceColors.color_949494,
                    onTap: (index) {
                      controller.tabIndex.value = index;
                      controller.pageController?.jumpToPage(index);
                    },
                  )),
            ),
            body: PageView(
              controller: controller.pageController,
              children: controller.pages,
              physics: NeverScrollableScrollPhysics(),
            )),
        onWillPop: _isExit);
  }

  Future<bool> _isExit() async {
    if (controller.lastTime == null ||
        DateTime.now().difference(controller.lastTime!) >
            Duration(milliseconds: 1500)) {
      controller.lastTime = DateTime.now();
      Toast.show("再次点击退出应用");
      return false;
    }
    Toast.cancelToast();
    return true;
  }
}
