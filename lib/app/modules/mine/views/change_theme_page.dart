/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 09:25:21
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 13:20:53
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
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  var title = controller.themeList[index].name;
                  return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(Dimens.size15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Get.theme.accentColor,
                              borderRadius:
                                  BorderRadius.circular(Dimens.size10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$title",
                                style: TextStyle(
                                    fontSize: DimenFont.large,
                                    fontWeight: FontWeight.bold),
                              ),
                              index == controller.selectedIndex
                                  ? Text("currentTheme")
                                  : Text("")
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        controller.changeTheme(index, '');
                      });
                })));
  }
}
