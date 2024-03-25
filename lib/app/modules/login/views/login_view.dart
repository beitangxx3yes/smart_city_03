import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/login/views/register_view.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('用户登录'),
          centerTitle: true,
          elevation: 1,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenAdapter.height(100),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户账号",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
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
              height: ScreenAdapter.height(100),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("用户密码",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
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
                    controller.login();
                  }, child: const Text("登录")),
            ),
            SizedBox(height: ScreenAdapter.height(20),),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                    controller.username = "";
                    controller.password = "";
                    Get.to( const RegisterView());
                  },
                  child: const Text("没有账号？立即注册")),
            )

          ],
        ));
  }
}
