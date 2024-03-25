import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/start/views/set_ip_view.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()=>Stack(
          children: [
            Container(
              child: Swiper(
                onIndexChanged: (index){
                  controller.imageIndex.value = index;
                },
                loop: false,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: SwiperCustomPagination(builder: (context, config) {
                      return const DotSwiperPaginationBuilder(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          activeColor: Colors.white)
                          .build(context, config);
                    })),
                itemCount: controller.imagesList.length,
                itemBuilder: (context, index) {
                  return Image.asset(controller.imagesList[index]);
                },
              ),
            ),
            if(controller.imageIndex.value==4)Positioned(
                bottom: ScreenAdapter.height(220),
                left: ScreenAdapter.height(300),
                right: ScreenAdapter.height(300),
                child: Container(
                  width: ScreenAdapter.widht(400),
                  height: ScreenAdapter.height(100),
                  child: ElevatedButton(
                    onPressed: (){
                      controller.login();
                    },
                    child: Text("立即体验",style: TextStyle(color: Colors.black87),),
                  ),
                )),
            if(controller.imageIndex.value==4)Positioned(
                top: ScreenAdapter.height(40),
                right: ScreenAdapter.widht(50),
                child: TextButton(
                  onPressed: (){
                    Get.to(SetIpView());
                  },
                  child: Text("IP设置",style: TextStyle(color: Colors.white,
                      fontSize: ScreenAdapter.size(46)
                  ),),
                ))
          ],
        )));
  }
}
