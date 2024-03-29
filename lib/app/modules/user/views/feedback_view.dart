import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/user/controllers/feedback_controller.dart';

import '../../../services/screenAdapter.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override

  Widget _feedBack(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenAdapter.height(100),
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
          child: Text("反馈标题",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
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
              controller.feedBackTitle = value;
            },
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(100),
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenAdapter.height(40)),
          child: Text("反馈内容",style: TextStyle(fontSize: ScreenAdapter.size(37)),),
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
            maxLength: 150,
            maxLines: 10,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,),
            onChanged: (value) {
              controller.feedBackCentent = value;
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
                controller.sendFeedback();
              }, child: const Text("提交")),
        ),



      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('意见反馈'),
        centerTitle: true,
      ),
      body:_feedBack()
    );
  }
}
