import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/user/controllers/order_controller.dart';

import '../../../services/screenAdapter.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);



  Widget _orderCategory(){
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
      ),
      child: TabBar(
        controller: controller.tabController,
        labelColor: Colors.black45,
          labelPadding: EdgeInsets.all(ScreenAdapter.size(20)),
        tabs: [
          Text("已付款"),
          Text("未付款"),
        ],
      ),
    );
  }

  Widget _orderList() {
    return Container(
      child: Obx(()=>TabBarView(
        controller: controller.tabController,
        children: [
          ListView(
              shrinkWrap: true,
              children: controller.yOrder.map((item) => ListTile(
                title: Text("订单编号：${item["orderNo"]}"),
                subtitle: Text("日期：${item["payTime"]}"),
                trailing: Text('${item["orderType"]=="movie"?"电影":"外卖订餐"}'),
              )).toList()
          ),
          ListView(
              shrinkWrap: true,
              children: controller.nOrder.map((item) => ListTile(
                title: Text("订单编号：${item["orderNo"]}"),
                subtitle: Text("日期：2023-5-27"),
                trailing: Text('${item["orderType"]=="movie"?"电影":"外卖订餐"}'),
              )).toList()
          )
        ],
      ),)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('我的订单',style: TextStyle(fontSize: ScreenAdapter.size(40)),),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left,color: Colors.white,),
          onPressed: () {
            Get.back();
          },
          color: Colors.black87,
        ),
      ),
      body:Column(
        children: [
          _orderCategory(),
          Expanded(child: _orderList())
        ],
      )
    );
  }
}
