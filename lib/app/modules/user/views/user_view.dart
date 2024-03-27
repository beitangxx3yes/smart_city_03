import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/user/views/order_view.dart';
import 'package:smart_city_03/app/modules/user/views/re_password_view.dart';
import 'package:smart_city_03/app/modules/user/views/setting_view.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import 'package:video_player/video_player.dart';
import '../controllers/user_controller.dart';
import 'feedback_view.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  _appBar() {
    return Obx(() => SliverAnimatedOpacity(
          opacity: controller.showAppBarTitle.value ? 1.0 : 0,
          duration: Duration(milliseconds: 300),
          sliver: SliverAppBar(
            titleTextStyle: TextStyle(
                color: Colors.black87, fontSize: ScreenAdapter.size(37)),
            elevation: 1,
            excludeHeaderSemantics: true,
            title: controller.showAppBarTitle.value
                ? Text("${controller.userInfo.value["userName"]}")
                : Text(""),
            backgroundColor: controller.showAppBarTitle.value
                ? Colors.white
                : Colors.transparent,
            centerTitle: true,
            expandedHeight: ScreenAdapter.height(800),
            pinned: true,
            floating: true,
            stretch: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black87,
                  ))
            ],
          ),
        ));
  }

  Widget _userDetail() {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenAdapter.height(800),
        color: Colors.blue,
        child: Stack(
          children: [
            ///背景视频/图片
            Container(
              color: Colors.white,
              // clipBehavior: Clip.antiAlias,
              child: Obx(()=>Column(
                children: [
                if(controller.appBarBackGroundType.value=="image")
                  SizedBox(
                    width: double.infinity,
                    height: ScreenAdapter.height(500),
                    child: Image.file(controller.imageFile,fit: BoxFit.cover,),),
                  if(controller.appBarBackGroundType.value == "video")
                   SizedBox(
                     width: ScreenAdapter.widht(1080),
                     height: ScreenAdapter.height(500),
                     child:  AspectRatio(
                       aspectRatio:
                       controller.videoPlayerController.value.aspectRatio,
                       child: VideoPlayer(controller.videoPlayerController),
                     ),
                   )

                ],
              ))


            ),

            ///用户信息
            Positioned(
                height: ScreenAdapter.height(300),
                width: ScreenAdapter.widht(1080),
                bottom: 0,
                left: 0,
                child: Obx(() => Container(
                    height: ScreenAdapter.height(300),
                    width: ScreenAdapter.widht(1080),
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: ScreenAdapter.widht(720),
                        height: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.size(30)),
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${controller.userInfo.value["userName"]}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.size(45),
                                  color: Colors.black87),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {
                                  Get.to(SettingView());
                                },
                                child: Text("个人设置"))
                          ],
                        ),
                      ),
                    )))),

            ///头像
            Positioned(
                left: ScreenAdapter.widht(60),
                bottom: ScreenAdapter.height(150),
                child: Container(
                    width: ScreenAdapter.size(250),
                    height: ScreenAdapter.size(250),
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/tangtang/10002.jpg",
                        fit: BoxFit.cover,
                      ),
                    ))),

            ///切换用户背景按钮
            Positioned(
                top: ScreenAdapter.height(360),
                right: ScreenAdapter.widht(30),
                child: Container(
                  // padding: EdgeInsets.all(ScreenAdapter.size(3)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black87.withOpacity(0.3),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.accessibility,size: ScreenAdapter.size(70),),
                    color: Colors.white,
                    onPressed: (){
                      Get.bottomSheet(
                        Container(
                          child: Column(
                            children:  [
                              SizedBox(height: ScreenAdapter.height(30),),
                              ListTile(
                                onTap: () {
                                  controller.selectImage("image");
                                },
                                title: Text("从相册中选取图片"),
                              ),   ListTile(
                                onTap: (){
                                  controller.selectImage("video");

                                },
                                title: Text("从相册中选取视频"),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white

                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Column(
      children: [
        ListTile(
          title: Text("我的订单"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Get.to(OrderView());
          },
        ),
        ListTile(
          title: Text("修改密码"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Get.to(RePasswordView());
          },
        ),
        ListTile(
          title: Text("意见反馈"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Get.to(FeedbackView());
          },
        ),
      ],
    );
  }

  Widget _historyList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(30)),
          child: Text(
            "历史记录",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: ScreenAdapter.size(37)),
          ),
        ),
        for (int i = 0; i < 20; i++)
          ListTile(
            title: Text("$i"),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => CustomScrollView(
            physics: BouncingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              controller.showAppBarTitle.value ? _appBar() : _userDetail(),
              SliverList(
                  delegate: SliverChildListDelegate([
                _banner(),
                SizedBox(
                  height: ScreenAdapter.height(30),
                ),
                _historyList()
              ])),
            ],
          ),
        ));
  }
}
