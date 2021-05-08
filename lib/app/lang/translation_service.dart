/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 14:13:24
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/lang/zh_CN.dart';
import 'package:flutter_getx_project_template/app/utils/sp_utils/sp_utils.dart';
import 'package:get/get.dart';
import 'en_us.dart';

class TranslationService extends Translations {
  static Locale? get locale {
    String languageCode = SpUtils.get<String>('locale');
    var locale = languageCode.isEmpty ? Get.deviceLocale : Locale(languageCode);
    return locale;
  }

  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en_US,
        'zh': zh_CN,
      };
}
