/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 11:16:33
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 13:17:19
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeLanguageController extends GetxController {
  List<Map> languages = TranslationService().keys.values.toList();
  late List<String> titles;
  var selectedIndex = 0.obs;
  final box = GetStorage();
  @override
  void onInit() {
    var locale = box.read('locale');
    titles = TranslationService().keys.keys.toList();
    selectedIndex.value = titles.indexOf(locale);
    super.onInit();
  }

  void changeLanauage(Locale locale) {
    Get.updateLocale(locale);
    box.write('locale', locale.languageCode);
  }
}
