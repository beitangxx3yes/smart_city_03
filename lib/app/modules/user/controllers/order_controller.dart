import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class OrderController extends GetxController with GetTickerProviderStateMixin{
  //TODO: Implement OrderController

  final count = 0.obs;

  RxList yOrder = [].obs;
  RxList nOrder = [].obs;

  late TabController tabController;




  void getOrder () async{

    var res =await HttpsClient.get("/prod-api/api/allorder/list");

    for(var item in res["rows"]){
      if(item["orderStatus"]=="待评价"){
        yOrder.add(item);
      }else if(item["orderStatus"]=="待支付"){
        nOrder.add(item);
      }
    }

   update();

  }



  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getOrder();

  }



  @override
  void onClose() {
    super.onClose();

  }

  void increment() => count.value++;
}
