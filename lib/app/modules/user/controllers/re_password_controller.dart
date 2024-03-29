import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class RePasswordController extends GetxController {
  //TODO: Implement RePasswordController

  final count = 0.obs;
  
  String oldPassword = "";
  String newPassword = "";
  
  
  void rePassword() async{

    if(newPassword.length!=6){
      Fluttertoast.showToast(msg: "新密码长度需6位");
      return;
    }


    var res = await HttpsClient.put(
        "/prod-api/api/common/user/resetPwd?oldPassword:${oldPassword}&newPassword:${newPassword}",
        {
          "oldPassword":oldPassword,
          "newPassword":newPassword

        });
    print(res);

    if(res["code"]==200){
      Fluttertoast.showToast(msg: "修改密码成功");
      Get.back();
    }else{
      Fluttertoast.showToast(msg: res["msg"]);
    }
  }
  
  
  @override
  void onInit() {
    super.onInit();
  }
  

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
