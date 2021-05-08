/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 11:16:33
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 11:39:51
 */
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  List<Map> languages = TranslationService().keys.values.toList();
  late List<String> titles;
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    titles = TranslationService().keys.keys.toList();
    print(TranslationService().keys.values);
    super.onInit();
  }
}
