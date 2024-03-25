import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/httpsClient.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{
  //TODO: Implement HomeController

  ///新闻分类index
  RxInt categoryIndex = 0.obs;


  late TabController tabController ;


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
  

  ///获取轮播图
  void getRotation() async{
    var res = await HttpsClient.get("/prod-api/api/rotation/list");
    rotationList.value = res["rows"];
  }
  ///获取推荐服务
  void getService() async{
    var res = await HttpsClient.get("/prod-api/api/service/list");
    List topServiceList = [];
    for(var e in res["rows"]){
      if(e["serviceName"]=="城市地铁"||e["serviceName"]=="智慧巴士"||e["serviceName"]=="门诊预约"||e["serviceName"]=="停哪儿"||e["serviceName"]=="智慧交管"){
        topServiceList.add(e);
      }
    }
    serviceList.value = topServiceList;
    print(serviceList.value.length);
  }

  ///推荐服务点击跳转
  void serviceTap(id){
    print(id);
  }

 ///专题
  void getTopic() async{
    var res = await HttpsClient.get("/prod-api/press/press/list");
    for(int i =0;i<8;i++){
      topicList.add(res["rows"][i]);
    }
  }

  ///新闻分类
  void getCategory() async{
    var res = await HttpsClient.get("/prod-api/press/category/list");
    print(res);
    categoryList.value = res["data"];
    getNewsList(categoryList[0]["id"]);
    tabController = TabController(length: categoryList.length, vsync: this);
    update();

  }

  ///新闻列表
  void getNewsList(typeId) async{


    var res = await HttpsClient.get("/prod-api/press/press/list?type=${typeId}");
    newsList.value = res["rows"];
    update();

  }
  ///修改新闻分类
  void changeCategoryIndex(int index){
    categoryIndex.value = index;
    getNewsList(categoryList.value[index]["id"]);
    print("111");
    update();
  }



  @override
  void onInit() {
    super.onInit();
    HttpsClient();
    tabController = TabController(length: 0, vsync: this);
    getRotation();
    getService();
    getTopic();
    getCategory();


  }


  @override
  void onClose() {
    super.onClose();
  }

}
