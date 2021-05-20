/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-18 10:57:45
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:58:05
 */
import 'package:flutter/material.dart';

extension SizeBoxHeight on int {
  Widget heightSizeBox() {
    return SizedBox(
      height: this.toDouble(),
    );
  }

  Widget widthSizeBox() {
    return SizedBox(
      width: this.toDouble(),
    );
  }
}

extension SizeBoxHeightExt on double {
  Widget heightSizeBox() {
    return SizedBox(
      height: this,
    );
  }

  Widget widthSizeBox() {
    return SizedBox(
      width: this,
    );
  }
}
