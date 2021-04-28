/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:03:30
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 15:38:08
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/index/controllers/index_controller.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
import 'package:flutter_getx_project_template/app/utils/toast/toast.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IndexPage extends GetView<IndexController> {
  DateTime? _lastTime;
  RxInt _tabIndex = 0.obs;
  PageController? _pageController;
  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: _tabIndex.value);
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
                    currentIndex: _tabIndex.value,
                    elevation: 0,
                    iconSize: Dimens.size24,
                    selectedFontSize: DimenFont.normal,
                    unselectedFontSize: DimenFont.normal,
                    selectedItemColor: ResourceColors.color_08B16B,
                    unselectedItemColor: ResourceColors.color_949494,
                    onTap: (index) {
                      _tabIndex.value = index;
                      _pageController?.jumpToPage(index);
                    },
                  )),
            ),
            body: PageView(
              controller: _pageController,
              children: controller.pages,
              physics: NeverScrollableScrollPhysics(),
            )),
        onWillPop: _isExit);
  }

  Future<bool> _isExit() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) > Duration(milliseconds: 1500)) {
      _lastTime = DateTime.now();
      Toast.show("再次点击退出应用");
      return false;
    }
    Toast.cancelToast();
    return true;
  }
}
