import 'package:get/get.dart';

import 'package:smart_city_03/app/modules/user/controllers/setting_controller.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
