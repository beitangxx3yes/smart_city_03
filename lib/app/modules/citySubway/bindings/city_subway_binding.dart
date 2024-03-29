import 'package:get/get.dart';

import '../controllers/city_subway_controller.dart';

class CitySubwayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CitySubwayController>(
      () => CitySubwayController(),
    );
  }
}
