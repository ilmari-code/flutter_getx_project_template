/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-20 09:21:53
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 15:40:50
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/features_controller.dart';

class FeaturesPage extends GetView<FeaturesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeaturesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FeaturesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
