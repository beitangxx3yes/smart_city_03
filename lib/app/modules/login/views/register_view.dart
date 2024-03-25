import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/login/controllers/login_controller.dart';

import '../../../services/screenAdapter.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('用户注册'),
          centerTitle: true,
          elevation: 1,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenAdapter.height(70),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户账号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            ///账号
            Container(
              margin: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              padding: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "账号"),
                onChanged: (value) {
                  controller.username = value;
                },
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(70),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户昵称",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            ///昵称
            Container(
              margin: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              padding: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "昵称"),
                onChanged: (value) {
                  controller.nickName = value;
                },
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(70),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户手机号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            ///手机号
            Container(
              margin: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              padding: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "手机号"),
                onChanged: (value) {
                  controller.phoneNum = value;
                },
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(70),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户密码",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            ///密码
            Container(
              margin: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              padding: EdgeInsets.only(
                  left: ScreenAdapter.widht(40),
                  right: ScreenAdapter.widht(40)),
              color: const Color.fromRGBO(235, 235, 235, 1),
              child: TextField(
                autofocus: true,
                maxLength: 6,
                decoration: const InputDecoration(
                  counterText: "",
                    border: InputBorder.none, hintText: "密码"),
                onChanged: (value) {
                  controller.password = value;
                },
              ),
            ),
            SizedBox(height: ScreenAdapter.height(100),),
            Container(
              width: double.infinity,
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(left: ScreenAdapter.widht(40),right: ScreenAdapter.widht(40)),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: (){
                    controller.register();
                  }, child: const Text("注册")),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                    controller.username = "";
                    controller.password = "";
                    controller.phoneNum = "";
                    controller.nickName = "";
                    Get.to( const RegisterView());
                  },
                  child: const Text("已有账号？立即登录")),
            )

          ],
        ));
  }
}
