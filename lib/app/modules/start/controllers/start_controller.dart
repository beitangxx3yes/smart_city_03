import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_03/app/services/storage.dart';

class StartController extends GetxController {
  //TODO: Implement StartController

List<String> imagesList = [
  "assets/smart_city_images/guide1.jpg",
  "assets/smart_city_images/guide2.jpg",
  "assets/smart_city_images/guide3.jpg",
  "assets/smart_city_images/guide4.jpg",
  "assets/smart_city_images/guide5.jpg",
];

///轮播index
RxInt imageIndex = 0.obs;

///ip输入
String ip = "";

///保存ip
 void saveIP() async{
   ///输入框IP为空
   if(ip == ""){
     Fluttertoast.showToast(msg: "请输入IP后再保存");
     return;
   }
   await Storage.setData("ip", ip);
   Get.back();
 }

 ///前往主页|登录页
 void login() async{
   if(await Storage.getData("ip")==null){
     Fluttertoast.showToast(msg: "请先输入ip!");
     return;
   }
   if(await Storage.getData("token")==null){
     Get.offNamed("/login");
     return ;
   }
   Get.offNamed("/tabs");

 }


  @override
 void onInit() {
    super.onInit();
    HttpClient();

  }

  ///focusNode
 FocusNode focusNode = FocusNode();


  @override
  void onClose() {
    super.onClose();
  }

}
