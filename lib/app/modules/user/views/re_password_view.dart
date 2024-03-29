import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/login/views/register_view.dart';
import 'package:smart_city_03/app/modules/user/controllers/re_password_controller.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';


class RePasswordView extends GetView<RePasswordController> {
  const RePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('修改密码'),
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
              child: Text("原密码",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
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
                    border: InputBorder.none,),
                onChanged: (value) {
                  controller.oldPassword = value;
                },
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(100),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
              child: Text("新密码",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
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
                    border: InputBorder.none,),
                onChanged: (value) {
                  controller.newPassword = value;
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
                    controller.rePassword();
                  }, child: const Text("确定")),
            ),



          ],
        ));
  }
}
