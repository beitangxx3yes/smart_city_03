
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_03/app/services/storage.dart';
import 'package:get/get.dart';

class HttpsClient{
  static String domain = "http://10.200.2.3:10001/";
  static Dio dio = Dio();
  static String token = "";


  static getToken() async{
    token =  await Storage.getData("token")??"";
  }

  static init() async{
   await getToken();
   // print(token);
   BaseOptions options = BaseOptions();
   options.baseUrl = domain;

   // options.connectTimeout = const Duration(milliseconds: 5000);
   // options.receiveTimeout = const Duration(milliseconds: 3000);
   options.responseType = ResponseType.json;
   // options.headers = {"Authorization":token};
   dio.options = options;

  }


   static Future<dynamic> get (String api) async{
    String token = await Storage.getData("token")??"";
    dio.options.headers = {"Authorization":token};
    var res = await dio.get(api);
    if(res.data["code"]!=200){
      Fluttertoast.showToast(msg: res.data["msg"]);
    }
    if(res.data["code"]==401){
      Get.defaultDialog(
          title: "提示",
          content: Text("用户认证已过期，请重新登录"),
          actions: [
            TextButton(onPressed: (){
              Storage.removeData("token");
              Get.offAllNamed("/login");
              Get.back();
            }, child: Text("确认"))
          ]
      );
    }
    return res.data;
  }

  static Future<dynamic> post (String api,Map data) async{
    String token = await Storage.getData("token")??"";
    dio.options.headers = {"Authorization":token};
    try{
      var res = await dio.post(api,data: data);
      if(res.data["code"]!=200){
        Fluttertoast.showToast(msg: res.data["msg"]);
      }
      if(res.data["code"]==401){
        Get.defaultDialog(
            title: "提示",
            content: Text("用户认证已过期，请重新登录"),
            actions: [
              TextButton(onPressed: (){
                Storage.removeData("token");
                Get.offAllNamed("/login");
                Get.back();
              }, child: Text("确认"))
            ]
        );
      }
      return res.data;
    }catch(e){
      print("请求数据异常");
      return null;
    }
  }

  static Future<dynamic> put (String api,Map data) async{
    String token = await Storage.getData("token")??"";
    dio.options.headers = {"Authorization":token};
    try{
      var res = await dio.put(api,data: data);
      if(res.data["code"]!=200){
        Fluttertoast.showToast(msg: res.data["msg"]);
      }
      if(res.data["code"]==401){
        Get.defaultDialog(
            title: "提示",
            content: Text("用户认证已过期，请重新登录"),
            actions: [
              TextButton(onPressed: (){
                Storage.removeData("token");
                Get.offAllNamed("/login");
                Get.back();
              }, child: Text("确认"))
            ]
        );
      }
      return res.data;
    }catch(e){
      print("请求数据异常");
      return null;
    }
  }

  static String replaeUrl(String pic) {
    if(pic == null)return "";
    String picUrl = domain+pic;
    return picUrl.replaceAll("\\", "/");
  }

}