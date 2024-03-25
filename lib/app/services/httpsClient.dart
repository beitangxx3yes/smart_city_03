

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_03/app/services/storage.dart';

class HttpsClient{
  static String domain = "http://10.200.2.3:10001/";
  static Dio dio = Dio();
  static String token = "";


  void getToken() async{
    token =  await Storage.getData("token")??"";
  }

  HttpsClient() {
    BaseOptions options = BaseOptions();
    options.baseUrl = domain;
    getToken();
    options.connectTimeout = const Duration(milliseconds: 5000);
    options.receiveTimeout = const Duration(milliseconds: 3000);
    options.responseType = ResponseType.json;
    options.headers = {"contentType":"application/json","Authorization":token};
    dio.options = options;

  }

   static Future<dynamic> get (String api) async{
    try{
      var res = await dio.get(api);
      return res.data;
    }catch(e){
      print("请求数据异常");
      return null;
    }
  }

  static Future<dynamic> post (String api,Map data) async{
    try{
      var res = await dio.post(api,data: data);
      if(res.data["code"]!=200){
        Fluttertoast.showToast(msg: res.data["msg"]);
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