import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import '../../../services/httpsClient.dart';

class NewsController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement HomeController

  ///新闻分类index
  RxInt categoryIndex = 0.obs;

  ///数据是否加载完成
  RxBool isLoding = false.obs;
  late TabController tabController;

  ///轮播图列表
  RxList rotationList = [].obs;

  ///推荐服务列表
  RxList serviceList = [].obs;

  ///专题列表
  RxList topicList = [].obs;

  ///新闻分类
  RxList categoryList = [].obs;

  ///新闻列表
  RxList newsList = [].obs;

  ///newsList 是否上划到顶部
  RxBool newsListOnTop = true.obs;

  ///newsList控制器


  ScrollController scrollController = ScrollController();



  ///获取轮播图
  void getRotation() async {
    var res = await HttpsClient.get("/prod-api/api/rotation/list");
    rotationList.value = res["rows"];
  }

  ///获取推荐服务
  void getService() async {
    var res = await HttpsClient.get("/prod-api/api/service/list");
    List topServiceList = [];
    for (var e in res["rows"]) {
      if (e["serviceName"] == "城市地铁" ||
          e["serviceName"] == "智慧巴士" ||
          e["serviceName"] == "门诊预约" ||
          e["serviceName"] == "停哪儿" ||
          e["serviceName"] == "智慧交管") {
        topServiceList.add(e);
      }
    }
    serviceList.value = topServiceList;
  }

  ///推荐服务点击跳转
  void serviceTap(id) {
    print(id);
  }


  ///专题
  void getTopic() async {
    var res = await HttpsClient.get("/prod-api/press/press/list");
    for (int i = 0; i < 8; i++) {
      topicList.add(res["rows"][i]);
    }
  }

  ///新闻分类
  void getCategory() async {
    var res = await HttpsClient.get("/prod-api/press/category/list");
    categoryList.value = res["data"];
    newsList.value = List.generate(categoryList.length, (index) => []);
    // getNewsList(categoryList[0]["id"]);
    getNewsList();
    tabController = TabController(length: categoryList.length, vsync: this);
    isLoding.value = true;
    update();
  }

  ///新闻列表
  Future<void> getNewsList() async {


    await Future.wait(categoryList.asMap().entries.map((entry) async {
      var index = entry.key;
      var item = entry.value;
      var res = await HttpsClient.get(
          "/prod-api/press/press/list?type=${item["id"]}");
      newsList[index] = res["rows"];
    }));

    update();
  }

  ///修改新闻分类
  void changeCategoryIndex(int index) {
    categoryIndex.value = index;
    update();
  }



  @override
  void onInit() {
    super.onInit();
    HttpsClient.init();
    tabController = TabController(length: 0, vsync: this);
    getRotation();
    getCategory();

  }

  @override
  void onClose() {
    super.onClose();
  }
}
