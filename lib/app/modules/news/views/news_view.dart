import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/news/controllers/news_controller.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';
import 'package:smart_city_03/app/services/keepAliveWrapper.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';


class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);

  @override

  ///轮播图
  Widget _rotation() {
    return Container(
      width: ScreenAdapter.widht(1080),
      height: ScreenAdapter.height(500),
      child: Obx(
            () => Swiper(
              onTap: (index){
                Get.toNamed("/news-detail",arguments: {"id":controller.rotationList[index]["id"]});
              },
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



  ///新闻分类标题栏
  Widget _categoryTitle() {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenAdapter.widht(20), right: ScreenAdapter.widht(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "新闻分类",
            style: TextStyle(
                fontSize: ScreenAdapter.size(37), color: Colors.black87),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }

  ///新闻分类
  Widget _category() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
      ),
      child: Column(children: [
        Expanded(child: Obx(
              () =>Container(
            // color: Colors.blue,
            child:  TabBar(
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
          ),
        ),)
        // Divider()
      ]),
    );
    // return Container(
    //   // height: ScreenAdapter.height(100),
    //   color: Colors.blue,
    // );
  }

  ///新闻
  Widget _news() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(20)),
      sliver: SliverPrototypeExtentList(
        prototypeItem: Obx(() => SizedBox(
          //360 = 300(每块大小) + 两个高度padding 20 + margin 20
          height: controller.isLoding.value
              ? ScreenAdapter.height(controller
              .newsList[controller.categoryIndex.value].length *
              320)
              : 0,
          // height: ScreenAdapter.height(1920),
        )),
        delegate: SliverChildListDelegate([
          Obx(() => controller.isLoding.value
              ? KeepAliveWrapper(
              child: TabBarView(
                controller: controller.tabController,
                children: controller.newsList
                    .map((element) => ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (var item in element)
                      InkWell(
                        onTap: (){
                          Get.toNamed("/news-detail",arguments: {"id":item["id"]});
                        },
                      child:  Container(
                          margin: EdgeInsets.only(
                              top: ScreenAdapter.height(20)),
                          padding:
                          EdgeInsets.all(ScreenAdapter.size(20)),
                          height: ScreenAdapter.height(300),
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                width: ScreenAdapter.widht(300),
                                height: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: item["cover"] != null
                                    ? Image.network(
                                  HttpsClient.replaeUrl(
                                      item["cover"]),
                                  fit: BoxFit.cover,
                                )
                                    : Image.asset(
                                    "assets/sysImage/failImage.jpg"),
                              ),
                              SizedBox(
                                width: ScreenAdapter.widht(30),
                              ),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item["title"]}",
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
                                      Text(
                                        "测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题测试新闻子标题",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                            ScreenAdapter.size(30),
                                            color: Colors.black54),
                                      ),
                                      SizedBox(
                                        height: ScreenAdapter.widht(10),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${item["publishDate"]}",
                                            style: TextStyle(
                                                fontSize:
                                                ScreenAdapter.size(32)),
                                          ),
                                          SizedBox(width: ScreenAdapter.widht(20),),
                                          Icon(
                                            Icons.comment,color: Colors.black54,
                                            size: ScreenAdapter.size(35),),

                                          SizedBox(width: ScreenAdapter.widht(10),),

                                          Text("${item["commentNum"]}"),
                                          SizedBox(width: ScreenAdapter.widht(20),),
                                          Icon(
                                            Icons.favorite,color: Colors.black54,
                                            size: ScreenAdapter.size(35),),

                                          SizedBox(width: ScreenAdapter.widht(10),),

                                          Text("${item["likeNum"]}")
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        )

                      )
                  ],
                ))
                    .toList(),
              ))
              : const CircularProgressIndicator())
        ]),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: ScreenAdapter.widht(240),
          title: const Text(
            '热点新闻',
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

          ],
          elevation: 1,
        ),
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                _rotation(),
                ///新闻分类标题栏
                // _categoryTitle()
              ]),
            ),

            ///新闻分类
            SliverPersistentHeader(
              delegate: TabBarHeader(
                _category(),
              ),
              pinned: true,
            ),
            _news()
          ],
        ));
  }
}

class TabBarHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  TabBarHeader(this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => ScreenAdapter.height(160);

  @override
  // TODO: implement minExtent
  double get minExtent => ScreenAdapter.height(160);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
