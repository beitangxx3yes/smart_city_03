import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController
  ///tab页面
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0,);

///chnagePage
 void changePage(index){
   pageIndex.value = index;
   pageController.jumpToPage(index);
   update();
 }


  @override
  void onInit() {
    super.onInit();
    HttpsClient();
  }


  @override
  void onClose() {
    super.onClose();
  }

}
