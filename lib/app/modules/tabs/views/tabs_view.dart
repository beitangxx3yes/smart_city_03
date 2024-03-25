import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/home/views/home_view.dart';
import 'package:smart_city_03/app/modules/news/views/news_view.dart';
import 'package:smart_city_03/app/modules/service/views/service_view.dart';
import 'package:smart_city_03/app/modules/user/views/user_view.dart';
import 'package:smart_city_03/app/services/keepAliveWrapper.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {

  Widget _homePage(){
    return PageView(
      controller: controller.pageController,
      onPageChanged: (index){
        controller.pageIndex.value = index;
      },
      children: [
        HomeView(),
        ServiceView(),
        NewsView(),
        UserView(),
      ],
    );
  }



  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(child: Obx(() => Scaffold(
      body:_homePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.pageIndex.value,
        onTap: (index){
          controller.changePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),           BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: "服务",
          ),           BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "新闻",
          ),           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
        ],
      ),
    )));
  }
}
