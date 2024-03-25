import 'package:flutter/material.dart';
import 'package:smart_city_03/app/modules/start/controllers/start_controller.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import 'package:get/get.dart';

class SetIpView extends GetView<StartController> {
  const SetIpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///自动弹出小键盘
    // FocusScope.of(context).requestFocus(controller.focusNode);
    return Scaffold(

      appBar: AppBar(
        title: const Text('设置IP'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenAdapter.height(100),),
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.widht(40),right: ScreenAdapter.widht(40)),
              child: Text("请输入IP",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
            ),
            SizedBox(height: ScreenAdapter.height(40),),
            Container(
              margin: EdgeInsets.only(left: ScreenAdapter.widht(40),right: ScreenAdapter.widht(40)),
              padding: EdgeInsets.only(left: ScreenAdapter.widht(40),right: ScreenAdapter.widht(40)),
              color:const Color.fromRGBO(235, 235, 235, 1),
              child: TextField(
                focusNode: controller.focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  hintText: "格式：10.200.2.3：10001"
                ),
                onChanged: (value){
                  controller.ip = value;
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
                    controller.saveIP();
                  }, child: const Text("保存")),
           )
          ],
        )
      ),
    );
  }
}
