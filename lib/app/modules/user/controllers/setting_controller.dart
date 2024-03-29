
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';
import 'package:smart_city_03/app/services/storage.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  RxMap userInfo = {}.obs;

TextEditingController userName = TextEditingController();
TextEditingController nickName = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController idCard = TextEditingController();
TextEditingController email = TextEditingController();
RxString sex = "0".obs;
  
  
  void getUserInfo() async{

    userInfo.value = await Storage.getData("userInfo");
    userName.text = userInfo["userName"];
    nickName.text = userInfo["nickName"];
    phoneNumber.text = userInfo["phonenumber"];
   idCard.text = userInfo["idCard"];
   email.text = userInfo["email"];
   sex.value = userInfo["sex"];
  }
  
  void saveUserInfo() async{

    Map newUserInfo = {
      "userName":userName.text,
      "nickName":nickName.text,
      "phonenumber":phoneNumber.text,
      "idCard":idCard.text,
      "email":email.text,
      "sex":sex.value
    };

    print(userInfo);

    var res =  await HttpsClient.put("/prod-api/api/common/user", newUserInfo);

    if(res["code"]==200){
      Fluttertoast.showToast(msg: "保存成功！");
      
      var res = await HttpsClient.get("/prod-api/api/common/user/getInfo");
      await Storage.setData("userInfo", res["user"]);

      Get.back();
    }else{
      Fluttertoast.showToast(msg: "保存失败");
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

 
  @override
  void onClose() {
    super.onClose();
  }

}
