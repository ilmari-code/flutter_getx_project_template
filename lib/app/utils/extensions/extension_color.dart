/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 10:50:36
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 10:53:04
 */
import 'dart:math' as math;

import 'package:flutter/material.dart';

extension ColorExt on Colors {
  int random(int min, int max) {
    final _random = math.Random();
    return min + _random.nextInt(max - min + 1);
  }

  ///随机色
  randomColor() {
    return Color.fromARGB(
        random(150, 255), random(0, 255), random(0, 255), random(0, 255));
  }
}
