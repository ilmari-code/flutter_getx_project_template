/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-13 08:26:41
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/my_app.dart';
import 'app/plugins/options/options.dart';

void main() async {
  await initApp(Environment.prod);
  runApp(MyApp());
}
