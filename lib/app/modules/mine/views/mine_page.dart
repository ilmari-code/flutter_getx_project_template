/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:20:06
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
import 'package:flutter_getx_project_template/app/routes/mine_route.dart';
import 'package:flutter_getx_project_template/app/routes/utils/get_navigator.dart';
import 'package:flutter_getx_project_template/app/utils/toast/toast.dart';

import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MinePage extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MineView'),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return buildRow(index, controller.titleList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: Dimens.zero);
            },
            itemCount: controller.titleList.length));
  }

  Container buildRow(int index, String title) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(Dimens.size15, Dimens.size15, Dimens.size15, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size8),
          color: ResourceColors.disabledBgColor),
      child: ListTile(
        title: Text("$title"),
        onTap: () {
          switch (index) {
            case 0:
              NavigatorUtils.push(MineRoute.SettingPageRoute);
              break;
            case 1:
              controller.logOut();
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
