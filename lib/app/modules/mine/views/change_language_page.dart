/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 11:15:42
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 14:30:04
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/mine/controllers/change_language_controller.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
import 'package:get/get.dart';

class ChangeLanguagePage extends GetView<ChangeLanguageController> {
  @override
  Widget build(BuildContext context) {
    int index = 2;
    return Scaffold(
        appBar: AppBar(title: Text('changeLanguagePage'.tr)),
        body: index == 1
            ? Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 300),
                child: Container(
                  height: Dimens.size80,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Dimens.size10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("电子券"),
                                Icon(Icons.arrow_circle_down)
                              ],
                            ),
                            Text("暂无电子琴")
                          ],
                        ),
                        VerticalDivider(
                            indent: Dimens.size10, endIndent: Dimens.size10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("电子券"),
                                Icon(Icons.arrow_circle_down)
                              ],
                            ),
                            Text("暂无电子琴")
                          ],
                        )
                      ]),
                ))
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = index;
                      Locale locale;
                      switch (index) {
                        case 0:
                          locale = Locale('en', 'US');
                          break;
                        case 1:
                          locale = Locale('zh', 'CN');
                          break;

                        default:
                          locale = Locale('en', 'US');
                          break;
                      }
                      controller.changeLanauage(locale);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          Dimens.size10, Dimens.size10, Dimens.size10, 0),
                      child: Obx(() => Container(
                            decoration: BoxDecoration(
                              border: controller.selectedIndex.value == index
                                  ? Border.all(
                                      color: Get.theme.primaryColor,
                                      width: Dimens.size1)
                                  : null,
                              color: ResourceColors.disabledBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimens.size10),
                            ),
                            padding: EdgeInsets.all(Dimens.size15),
                            child: Text(controller.titles[index]),
                          )),
                    ),
                  );
                },
                itemCount: controller.languages.length,
              ));
  }
}
