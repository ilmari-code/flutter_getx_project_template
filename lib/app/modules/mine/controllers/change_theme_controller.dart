/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 09:25:35
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 13:27:17
 */
import 'package:flutter_getx_project_template/app/plugins/options/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeThemeController extends GetxController {
  List<AppTheme> themeList = [lightTheme, darkTheme, customTheme];
  int selectedIndex = 0;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    String themeName = box.read('theme').toString();
    int index = themeList.indexWhere((element) => element.name == themeName);
    selectedIndex = (index == -1 ? 0 : index);
  }

  void changeTheme(int index, String theme) {
    selectedIndex = index;
    Get.changeTheme(themeList[index].data);
    box.write('theme', themeList[index].name);
  }
}
