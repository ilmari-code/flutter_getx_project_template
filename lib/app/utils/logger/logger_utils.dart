/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-12 00:11:22
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 16:22:10
 */
import 'package:flutter_getx_project_template/app/utils/log/log.dart';

class LoggerConfig {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => Log.info(text, isError));
  }
}
