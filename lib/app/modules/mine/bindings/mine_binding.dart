import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
}
