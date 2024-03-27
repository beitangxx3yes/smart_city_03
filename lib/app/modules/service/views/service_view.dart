import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({Key? key}) : super(key: key);

  @override
  _appBar() {
    return AppBar(
      leadingWidth: ScreenAdapter.widht(200),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Container(
          padding: EdgeInsets.all(ScreenAdapter.size(50)),
          width: ScreenAdapter.widht(700),
          height: ScreenAdapter.height(200),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(227, 225, 222, 1.0),
            ),
            child: TextField(
              style: TextStyle(
                height: 1.4
              ),
              cursorColor: Colors.black38,
              cursorHeight: ScreenAdapter.height(60),
              cursorWidth: ScreenAdapter.height(3),
              onChanged: (value){
                controller.searchValue = value;
              },
              decoration: InputDecoration(
                hintText: "搜索服务",
                  // contentPadding: EdgeInsets.only(left: ScreenAdapter.height(10)),
                border: InputBorder.none
              ),
            ),
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: ScreenAdapter.widht(30)),
          child: TextButton(onPressed: () {
            controller.search(controller.searchValue);
            Get.bottomSheet(
             Obx(() =>  Container(
               color: Get.isDarkMode?Colors.black87:Colors.white,
               height: ScreenAdapter.height(400),
               width: double.infinity,
               padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(10),
                   vertical:ScreenAdapter.height(70) ),
               child: GridView.builder(
                   shrinkWrap: true,
                   itemCount: controller.searchServiceList.length,
                   gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 5),
                   itemBuilder: (context, index) {
                     return InkWell(
                       onTap: () {
                         print(controller.searchServiceList[index]["id"]);
                       },
                       child: Column(
                         children: [
                           Image.network(
                             HttpsClient.replaeUrl(
                                 controller.searchServiceList.value[index]["imgUrl"]),
                             width: ScreenAdapter.size(100),
                             height: ScreenAdapter.size(100),
                           ),
                           SizedBox(
                             height: ScreenAdapter.height(20),
                           ),
                           Text(controller.searchServiceList.value[index]["serviceName"])
                         ],
                       ),
                     );
                   }),
             )),
            );
          }, child: Text("确定")),
        )
      ],
    );
  }

  ///左侧分类栏
  Widget _serviceCategory() {
    return Container(
        color: Colors.white,
        width: ScreenAdapter.widht(300),
        child: Obx(
          () => Column(
            children: controller.serviceCategory
                .map((item) => InkWell(
                      onTap: () {
                        controller.changeCategoryIndex(item["id"]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: controller.categoryIndex.value == item["id"]
                            ? Color.fromRGBO(250, 250, 250, 1)
                            : Colors.white,
                        height: ScreenAdapter.height(120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.stars_sharp,
                              color: controller.categoryIndex == item["id"]
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            SizedBox(
                              width: ScreenAdapter.widht(12),
                            ),
                            Text(
                              "${item["title"]}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenAdapter.size(37)),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
        // color: Colors.blue,
        );
  }

  ///右侧服务列表
  Widget _serviceList() {
    return Container(
        // color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(20)),
        child: Obx(() => SingleChildScrollView(
          child: SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              controller: controller.scrollController,
              itemCount: controller.initServiceList.length,
              itemBuilder: (context, index) {
                return Column(
                  key: controller.keyList[index],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenAdapter.height(30),
                    ),
                    Text(
                      "${controller.initServiceList.value[index]["title"]}",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenAdapter.size(33),
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: ScreenAdapter.height(30),
                    ),
                    Container(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .initServiceList.value[index]["service"].length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                          itemBuilder: (context, sindex) {
                            return InkWell(
                              onTap: () {
                                print(controller.initServiceList.value[index]
                                ["service"][sindex]["id"]);
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    HttpsClient.replaeUrl(
                                        controller.initServiceList.value[index]
                                        ["service"][sindex]["imgUrl"]),
                                    width: ScreenAdapter.size(100),
                                    height: ScreenAdapter.size(100),
                                  ),
                                  SizedBox(
                                    height: ScreenAdapter.height(20),
                                  ),
                                  Text(controller.initServiceList.value[index]
                                  ["service"][sindex]["serviceName"])
                                ],
                              ),
                            );
                          }),
                    ),
                    Divider()
                  ],
                );
              },
            ),
          ),
        )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Row(
          children: [_serviceCategory(), Expanded(child: _serviceList())],
        ));
  }
}
