import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

class NewsDetailController extends GetxController {
  //TODO: Implement NewsDetailController

  final count = 0.obs;


  ///新闻详情
  RxMap detail = {}.obs;


  ///获取新闻详情和新闻评论
  void getNewsDetail() async {
    var res  = await HttpsClient.get("/prod-api/press/press/${Get.arguments["id"]}");
    detail.value  =res["data"];
    print(detail);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getNewsDetail();
  }


  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
