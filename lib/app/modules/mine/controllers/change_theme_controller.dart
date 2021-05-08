/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 09:25:35
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 10:57:32
 */
import 'package:flutter_getx_project_template/app/plugins/options/themes.dart';
import 'package:get/get.dart';

class ChangeThemeController extends GetxController {
  List<AppTheme> themeList = [lightTheme, darkTheme, customTheme];
  int selectedIndex = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
