import 'package:get/get.dart';

import 'package:smart_city_03/app/modules/news/controllers/news_detail_controller.dart';

import '../controllers/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailController>(
      () => NewsDetailController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
