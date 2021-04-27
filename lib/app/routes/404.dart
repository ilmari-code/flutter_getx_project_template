/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-25 11:03:27
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 15:29:26
 */
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("页面不存在"),
      ),
      body: Center(
        child: Text(
          '很抱歉，页面已经搬家了~',
          style: TextStyle(fontSize: 26.0),
        ),
      ),
    );
  }
}
