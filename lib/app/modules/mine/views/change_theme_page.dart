/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 09:25:21
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 10:11:47
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/mine/controllers/change_theme_controller.dart';
import 'package:flutter_getx_project_template/app/plugins/options/themes.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:get/get.dart';

class ChangeThemePage extends GetView<ChangeThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ChangeThemePage')),
        body: SafeArea(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: Dimens.size10,
                    crossAxisSpacing: Dimens.size10),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  var title = "light";
                  switch (index) {
                    case 0:
                      title = "light";
                      break;
                    case 1:
                      title = "dark";
                      break;
                    case 2:
                      title = "custom";
                      break;
                    default:
                      title = "light";
                  }
                  return GestureDetector(
                      child: Container(
                        width: Dimens.size100,
                        height: Dimens.size100,
                        child: Container(
                          color: Get.theme.accentColor,
                          child: Center(
                            child: Text("$title"),
                          ),
                        ),
                      ),
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.changeTheme(ThemeData.light());
                            break;
                          case 1:
                            Get.changeTheme(ThemeData.dark());
                            break;
                          case 2:
                            Get.changeTheme(customTheme.data);
                            break;
                          default:
                            Get.changeTheme(ThemeData.light());
                        }
                      });
                })));
  }
}
