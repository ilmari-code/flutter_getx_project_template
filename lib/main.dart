/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 16:29:57
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:flutter_getx_project_template/app/routes/app_routes.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';
import 'package:flutter_getx_project_template/app/utils/logger/logger_utils.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.configuration(Level.ALL);
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.allPages,
      unknownRoute: AppRoutes.getNotFoundPage(),
      // logWriterCallback: LoggerConfig.write,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      routingCallback: (value) {
        Log.info(value?.current);
      },
    );
  }
}
