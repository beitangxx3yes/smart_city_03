import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class FeedbackController extends GetxController {
  //TODO: Implement FeedbackController
  

  String feedBackTitle ="";
  String feedBackCentent = "";
  
  
  void sendFeedback() async{


    if(feedBackCentent ==""){
      Fluttertoast.showToast(msg: "请输入意见再反馈");
      return;
    }

    Map feedBack = {
      "title":feedBackTitle,
      "content":feedBackCentent
    };

    var res = await HttpsClient.post("/prod-api/api/common/feedback",feedBack );

    if(res["code"]!=200){
      Fluttertoast.showToast(msg: "${res["msg"]}");
    }else{
      Fluttertoast.showToast(msg: "反馈成功！");
      Get.back();
    }


  }
  
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;
}
