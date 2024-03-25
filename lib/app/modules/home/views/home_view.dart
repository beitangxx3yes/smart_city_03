import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';
import 'package:smart_city_03/app/services/keepAliveWrapper.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override

  ///轮播图
  Widget _rotation() {
    return  Container(
          width: ScreenAdapter.widht(1080),
          height: ScreenAdapter.height(500),
          child: Obx(
            () => Swiper(
              duration: 2,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  builder: SwiperCustomPagination(builder: (context, config) {
                    return const DotSwiperPaginationBuilder(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            activeColor: Colors.white)
                        .build(context, config);
                  })),
              autoplay: true,
              itemCount: controller.rotationList.value.length,
              indicatorLayout: PageIndicatorLayout.SCALE,
              itemBuilder: (context, index) {
                return Image.network(
                  HttpsClient.replaeUrl(
                      controller.rotationList.value[index]["advImg"]),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
    );
  }

  ///推荐服务
  Widget _service() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: ScreenAdapter.height(40)),
        padding: EdgeInsets.only(
            left: ScreenAdapter.widht(20), right: ScreenAdapter.widht(20)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "推荐服务",
                  style: TextStyle(
                      fontSize: ScreenAdapter.size(37), color: Colors.black87),
                )
              ],
            ),
            SizedBox(
              height: ScreenAdapter.height(40),
            ),
            Row(
              children: controller.serviceList.value
                  .map((e) => Expanded(
                          child: InkWell(
                        onTap: () {
                          controller.serviceTap(e["id"]);
                        },
                        child: Column(
                          children: [
                            Image.network(
                              HttpsClient.replaeUrl(e["imgUrl"]),
                              width: ScreenAdapter.widht(120),
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(20),
                            ),
                            Text(
                              "${e["serviceName"]}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenAdapter.size(32)),
                            )
                          ],
                        ),
                      )))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  ///新闻专题
  Widget _topic() {
    return  Container(
        // color: Colors.blue,
        height: ScreenAdapter.height(500),
        // color: Colors.blue,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.widht(20)),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "专题",
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(37),
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(20),
            ),
            Expanded(
                child: Obx(() => Swiper(
                      itemCount: controller.topicList.length,
                      autoplay: true,
                      scale: 0.9,
                      viewportFraction: 0.7,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              width: double.infinity,
                              height: ScreenAdapter.height(300),
                              child: Image.network(
                                HttpsClient.replaeUrl(
                                  controller.topicList[index]["cover"],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Text(
                              "${controller.topicList.value[index]["title"]}",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenAdapter.size(37),
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        );
                      },
                    )))
          ],
        ),

    );
  }

  ///新闻分类
  Widget _category() {
    return  Obx(() => Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenAdapter.widht(20),
                  right: ScreenAdapter.widht(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "新闻分类",
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(37),
                        color: Colors.black87),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(20),
            ),
            TabBar(
              isScrollable: true,
              controller: controller.tabController,
              onTap: (index) {
                controller.changeCategoryIndex(index);
              },
              tabs: controller.categoryList
                  .map((item) => Text(
                        "${item["name"]}",
                        style: TextStyle(color: Colors.black54),
                      ))
                  .toList(),
            ),
          ]))
    ;
  }

  Widget _news() {
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(20)),
        // sliver: SliverPrototypeExtentList(
        //   prototypeItem: Obx(() => Container(
        //         height: ScreenAdapter.height(
        //             controller.newsList.value[controller.categoryIndex.value].length * 320),
        //       )),
        //   delegate: SliverChildListDelegate([
        //     Obx(() => KeepAliveWrapper(child: TabBarView(
        //       controller: controller.tabController,
        //       children: controller.newsList.value
        //           .map((element) => Column(
        //         children: [
        //           for (var item in element)
        //             Container(
        //               margin: EdgeInsets.only(
        //                   top: ScreenAdapter.height(20)),
        //               padding:
        //               EdgeInsets.all(ScreenAdapter.size(20)),
        //               height: ScreenAdapter.height(300),
        //               // color: Colors.blue,
        //               child: Row(
        //                 children: [
        //                   Container(
        //                     width: ScreenAdapter.widht(300),
        //                     height: double.infinity,
        //                     clipBehavior: Clip.antiAlias,
        //                     decoration: BoxDecoration(
        //                         borderRadius:
        //                         BorderRadius.circular(10)),
        //                     child: item["cover"] != null
        //                         ? Image.network(
        //                       HttpsClient.replaeUrl(
        //                           item["cover"]),
        //                       fit: BoxFit.cover,
        //                     )
        //                         : Image.asset(
        //                         "assets/sysImage/failImage.jpg"),
        //                   ),
        //                   SizedBox(
        //                     width: ScreenAdapter.widht(30),
        //                   ),
        //                   Expanded(
        //                       child: Column(
        //                         crossAxisAlignment:
        //                         CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             "${item["title"]}",
        //                             style: TextStyle(
        //                               fontSize: ScreenAdapter.size(37),
        //                               fontWeight: FontWeight.bold,
        //                             ),
        //                             maxLines: 2,
        //                             overflow: TextOverflow.ellipsis,
        //                           ),
        //                           SizedBox(
        //                             height: ScreenAdapter.widht(10),
        //                           ),
        //                           Text(
        //                             "测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题",
        //                             maxLines: 3,
        //                             overflow: TextOverflow.ellipsis,
        //                             style: TextStyle(
        //                                 fontSize:
        //                                 ScreenAdapter.size(30),
        //                                 color: Colors.black54),
        //                           ),
        //                           SizedBox(
        //                             height: ScreenAdapter.widht(10),
        //                           ),
        //                           Row(
        //                             mainAxisAlignment:
        //                             MainAxisAlignment.end,
        //                             children: [
        //                               Text(
        //                                 "${item["publishDate"]}",
        //                                 style: TextStyle(
        //                                     fontSize:
        //                                     ScreenAdapter.size(32)),
        //                               ),
        //                             ],
        //                           )
        //                         ],
        //                       ))
        //                 ],
        //               ),
        //             )
        //         ],
        //       ))
        //           .toList(),
        //     )))
        //   ]),
        // )

        sliver: SliverToBoxAdapter(
              child:Obx(()=> Column(
                children: controller.newsList.map((item) => Container(
                  margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
                  padding: EdgeInsets.all(ScreenAdapter.size(20)),
                  height: ScreenAdapter.height(300),
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        width: ScreenAdapter.widht(300),
                        height: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:item["cover"]!=null?
                        Image.network(HttpsClient.replaeUrl(item["cover"]),fit: BoxFit.cover,):
                        Image.asset("assets/sysImage/failImage.jpg"),
                      ),
                      SizedBox(width: ScreenAdapter.widht(30),),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item["title"]}",
                            style: TextStyle(
                              fontSize: ScreenAdapter.size(37),
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: ScreenAdapter.widht(10),
                          ),
                          Text("测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: ScreenAdapter.size(30),
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(
                            height: ScreenAdapter.widht(10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${item["publishDate"]}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.size(32)
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                )).toList(),
              ),)
          )
        );
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: ScreenAdapter.widht(240),
          title: const Text(
            '智慧城市',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email_outlined,
                  color: Colors.black87,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black87,
                ))
          ],
          elevation: 1,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              _rotation(),
              _service(),
          SizedBox(
                  height: ScreenAdapter.height(40),
                ),

              _topic(),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
              _category(),
            ]),

            ),
            _news()
          ],


        ));
  }
}
