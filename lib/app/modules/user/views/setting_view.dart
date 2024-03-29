import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/user/controllers/setting_controller.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);


  Widget _setting(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 顶部图片
        Container(
          width: double.infinity,
          height: ScreenAdapter.height(300),
          child: Image.asset("assets/smart_city_images/banner1.jpg",fit: BoxFit.cover,),
        ),
        
        
        ///账号
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: ScreenAdapter.widht(30)),
                width: ScreenAdapter.widht(200),
                child:  Text("用户账号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                padding: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                child: TextField(
                  controller: controller.userName,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: ""),
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
              ),)
            ],
          ) ,
        ),
        ///昵称
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: ScreenAdapter.widht(30)),
                width: ScreenAdapter.widht(200),
                child:  Text("用户昵称",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                padding: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                child: TextField(
                  controller: controller.nickName,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: ""),
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
              ),)
            ],
          ) ,
        ),
        ///电话号码
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(30)),
                width: ScreenAdapter.widht(200),
                child:  Text("手机号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                padding: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                child: TextField(
                  controller: controller.phoneNumber,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: ""),
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
              ),)
            ],
          ) ,
        ),
        ///用户邮箱
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
                child: Text("用户邮箱",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                padding: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                child: TextField(
                  controller: controller.email,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: ""),
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
              ),)
            ],
          ) ,
        ),
        ///省份证号
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
                child: Text("身份证号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                padding: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                color: const Color.fromRGBO(235, 235, 235, 1),
                child: TextField(
                  controller: controller.idCard,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: ""),
                  onChanged: (value) {
                    // controller.username = value;
                  },
                ),
              ),)
            ],
          ) ,
        ),
        ///性别
        Container(
          // color: Colors.blue,
          width: double.infinity,
          height: ScreenAdapter.height(200),
          child:Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
                child: Text("性别",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
              ),
              Expanded(child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    left: ScreenAdapter.widht(40),
                    right: ScreenAdapter.widht(40)),
                child:InkWell(
                  onTap: (){
                    Get.bottomSheet(Container(
                      child:Column(
                        children: [
                          ListTile(
                            onTap: (){
                              controller.sex.value = "0";
                              Get.back();
                            },
                            title: Text('男'),),
                          ListTile(
                            onTap: (){
                              controller.sex.value = "1";
                              Get.back();

                            },
                            title: Text('女'),),

                        ],
                      ) ,
                    ),

                    backgroundColor: Colors.white
                    );
                  },
                  child: Obx(()=>Container(
                    alignment: Alignment.center,
                    width: ScreenAdapter.widht(200),
                    height: ScreenAdapter.height(100),
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    child: Text(
                        "${controller.sex.value=="0"?"男":"女"}"),
                  ),
                  )
                )
              ),)
            ],
          ) ,
        ),

        SizedBox(
          height: ScreenAdapter.height(70),
        ),
        Container(
          width: double.infinity,
          height:ScreenAdapter.height(100),
          padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(40)),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),
            onPressed: (){
              controller.saveUserInfo();
            },
            child: Text("保存"),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('个人设置',style: TextStyle(fontSize: ScreenAdapter.size(40)),),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black87),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Get.back();
          },
          color: Colors.black87,
        ),
      ),
      body:ListView(
        children: [
          _setting()
        ],
      )
    );
  }
}
