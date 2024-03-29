import 'package:get/get.dart';

import '../../user/controllers/setting_controller.dart';
import '../controllers/tabs_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../service/controllers/service_controller.dart';
import '../../news/controllers/news_controller.dart';
import '../../user/controllers/user_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
          () => SettingController(),
    );

    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
