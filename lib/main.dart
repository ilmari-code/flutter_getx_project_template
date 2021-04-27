/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 15:35:52
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:flutter_getx_project_template/app/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.allPages,
      unknownRoute: AppRoutes.getNotFoundPage(),
      // logWriterCallback: Logger.write,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
