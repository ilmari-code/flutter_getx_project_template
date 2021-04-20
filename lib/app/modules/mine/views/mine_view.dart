import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}