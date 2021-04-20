import 'package:get/get.dart';

import '../controllers/features_controller.dart';

class FeaturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesController>(
      () => FeaturesController(),
    );
  }
}
