import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController
  ///tab页面
  RxInt pageIndex = 2.obs;
  PageController pageController = PageController(initialPage: 2,);

///chnagePage
 void changePage(index){
   pageIndex.value = index;
   pageController.jumpToPage(index);
   update();
 }


  @override
  void onInit() {
    super.onInit();
    HttpsClient.init();
  }


  @override
  void onClose() {
    super.onClose();
  }

}
