
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';
import 'package:smart_city_03/app/services/storage.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  String username = "";
  String password = "";
  String nickName = "";
  String phoneNum = "";

///用户登录
  void login() async{
    if(username == ""||password == ""){
      Fluttertoast.showToast(msg: "请输入账号");
      return;
    }

    var res = await HttpsClient.post("/prod-api/api/login", {
      "username":username,
      "password":password
    });
    if(res!=null){
      Storage.setData("token", res["token"]);
    }

    Fluttertoast.showToast(msg: "登录成功！");
    await Future.delayed(Duration(seconds: 2));
    await getUserInfo();
    Get.offNamed("/tabs");


    
    
  }

  getUserInfo() async {
    var res = await HttpsClient.get("/prod-api/api/common/user/getInfo");
    Storage.setData("userInfo", res["user"]);
    // userInfo.value = res["user"];
  }


  ///用户注册
  void register() async{
    if(username == ""||password==""||nickName==""||phoneNum==""){
      Fluttertoast.showToast(msg: "请输入完整信息");
      return;
    }
    if(password.length!=6){
      Fluttertoast.showToast(msg: "请输入6位密码");
      return;
    }
    
    var res = await HttpsClient.post("/prod-api/api/register", {
      "userName":username,
      "nickName":nickName,
      "passwork":password,
      "phoneNumber":phoneNum
    });

    if(res!=null){
      Fluttertoast.showToast(msg: "注册成功");
      await Future.delayed(Duration(seconds: 2));
      Get.back();
    }
    

  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    HttpsClient.init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
