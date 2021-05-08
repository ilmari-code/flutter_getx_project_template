/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 14:50:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class Toast {
  static show(String msg, {duration = 2000}) {
    if (msg.isNotEmpty) {
      showToast(msg, duration: Duration(milliseconds: duration));
    }
  }

  static cancelToast() {
    dismissAllToast();
  }
}

class GetToast {
  static show(String msg,
      {int duration = 2000,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.snackbar('', 'msg',
        titleText: SizedBox(
          height: 0.01,
        ),
        messageText: Center(
          child: Text("$msg"),
        ),
        duration: duration.milliseconds,
        snackPosition: snackPosition);
  }
}
