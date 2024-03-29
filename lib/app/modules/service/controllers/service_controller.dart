import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class ServiceController extends GetxController {
  //TODO: Implement ServiceController

  ///原始服务数据
  RxList serviceList  = [].obs;

  /// 分类
  RxInt categoryIndex = 0.obs;
  ///服务分类
  List serviceCategory = [
    {
      "id":0,
      "title":"便民服务"
    },
    {
      "id":1,
      "title":"生活服务"
    },
    {
      "id":2,
      "title":"车主服务"
    }
  ];
  ///分类完成的服务数据
  RxList initServiceList = [
    {
      "title":"便民服务",
      "service":[]
    },
        {
      "title":"生活服务",
      "service":[]
    },
        {
      "title":"车主服务",
      "service":[]
    },

  ].obs;

  /// 搜索框内容
  String searchValue = "";

  ///搜索结果服务
  RxList searchServiceList = [].obs;

  ///key
  GlobalKey key0 = GlobalKey();
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();

  ///服务列表控制器
  ScrollController scrollController = ScrollController();


  RxList<GlobalKey> keyList = <GlobalKey>[].obs;

  initKey(){
    keyList.add(key0);
    keyList.add(key1);
    keyList.add(key2);


  }

 void changeCategoryIndex(index){
   categoryIndex.value = index;
   Scrollable.ensureVisible(keyList[index].currentContext as BuildContext,  duration: Duration(milliseconds: 500)  );
   update();
 }

  void updateCategoryIndex(int index) {
    categoryIndex.value = index;
  }


  ///服务项点击
  void serviceTap(id){
    print(id);

    switch (id){
      case 2:
        Get.toNamed("/city-subway");
    }



  }





///失败的尝试
  // void changeCategoryIndex(index) {
  //   categoryIndex.value = index;
  //   final RenderObject renderObject =
  //   keyList[index].currentContext?.findRenderObject() as RenderObject;
  //   final RenderAbstractViewport viewport =
  //   RenderAbstractViewport.of(renderObject) as RenderAbstractViewport;
  //   final RevealedOffset offsetToReveal =
  //   viewport.getOffsetToReveal(renderObject, 0.5);
  //   Scrollable.ensureVisible(
  //     keyList[index].currentContext as BuildContext,
  //     alignment: 0.5,
  //     duration: Duration(milliseconds: 500),
  //   );
  //   update();
  // }

  void getService() async{
    var res = await HttpsClient.get("/prod-api/api/service/list");
    serviceList.value =  res["rows"];

    for(var item in serviceList.value){
      if(item["serviceType"]=="便民服务"){
        initServiceList.value[0]["service"].add(item);
      }else if(item["serviceType"]=="生活服务"){
        initServiceList.value[1]["service"].add(item);
      }else{
        initServiceList.value[2]["service"].add(item);
      }
    }

    update();
    print(initServiceList);
  }



  /// 搜索
  void search(value){
    searchServiceList.value = [];
   serviceList.forEach((element) {
     if(element["serviceName"].contains(value)){
       searchServiceList.value.add(element);
     }
   });
  }



  
  @override
  void onInit() {
    super.onInit();
    HttpClient();
    initKey();
    // scrollControllerlis();
    getService();

  }

  @override
  void onReady() {
    super.onReady();
  }
  
}
