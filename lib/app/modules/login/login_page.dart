/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-18 09:32:28
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:23:39
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'package:flutter_getx_project_template/app/utils/extensions/extension_dimens.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginPage')),
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: DimenFont.sp40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100.dimension(),
                ),
                Container(
                  height: 60.dimension(),
                  width: 250.dimension(),
                  child: TextField(
                    controller: controller.accountController,
                    decoration: InputDecoration(
                      fillColor: Color(0x30cccccc),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00FF0000)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.dimension()))),
                      hintText: 'QQ号/手机号/邮箱',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.dimension()))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.dimension(),
                ),
                Container(
                  height: 60.dimension(),
                  width: 250.dimension(),
                  child: TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      fillColor: Color(0x30cccccc),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00FF0000)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.dimension()))),
                      hintText: '密码',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.dimension()))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.dimension(),
                ),
                Container(
                  width: 120.dimension(),
                  height: 40.dimension(),
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isCanClickLogin.value
                            ? controller.clickLogin
                            : null,
                        child: Text('Login'),
                      )),
                ),
              ],
            )
          ],
        )));
  }
}
