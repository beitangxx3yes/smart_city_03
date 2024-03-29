import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_city_03/app/modules/news/controllers/news_detail_controller.dart';
import 'package:smart_city_03/app/services/httpsClient.dart';

import '../../../services/screenAdapter.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({Key? key}) : super(key: key);

  ///新闻详情
  Widget _newDetail() {
    return Obx(() => controller.detail.length != 0
        ? Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    HttpsClient.replaeUrl(controller.detail["cover"]),
                    fit: BoxFit.cover,
                  ),
                  // child: controller.detail["cover"]!=null?:Image.asset("assets/sysImage/failImage.jpg")
                ),

                SizedBox(
                  height: 20,
                ),

                ///新闻标题
                Text(
                  controller.detail["title"],
                  style: TextStyle(fontSize: 20),
                ),

                SizedBox(
                  height: 20,
                ),

                ///新闻内容
                Html(data: controller.detail["content"]),

                SizedBox(
                  height: 20,
                ),

                ///新闻日期
                Text(
                  "发布日期：${controller.detail["publishDate"]}",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.end,
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // newsCommon(id: widget.id)
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          ));
  }

  ///评论输入框 高度：220
  Widget _commentBox() {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.size(20)),
      height: ScreenAdapter.height(220),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1, color: Colors.black12))),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: ScreenAdapter.height(90),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenAdapter.widht(20)),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(235, 235, 235, 1.0),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "美好的一天从评论开始", border: InputBorder.none),
                      style: TextStyle(fontSize: ScreenAdapter.size(33)),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: ScreenAdapter.widht(300),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("评论"),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: ScreenAdapter.height(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("分享");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.forward_outlined,
                          color: Colors.black87,
                          size: ScreenAdapter.size(60),
                        ),
                        SizedBox(width: ScreenAdapter.widht(10),),
                        Text(
                          "分享",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.size(35)),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("评论");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          color: Colors.black87,
                          size: ScreenAdapter.size(50),
                        ),
                        SizedBox(width: ScreenAdapter.widht(10),),
                        Text(
                          "${controller.detail["commentNum"]}",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.size(35)),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("点赞");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.black87,
                          size: ScreenAdapter.size(60),
                        ),
                        SizedBox(width: ScreenAdapter.widht(10),),
                        Text(
                          "${controller.detail["likeNum"]}",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.size(35)),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("收藏");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.black87,
                          size: ScreenAdapter.size(60),
                        ),
                        SizedBox(width: ScreenAdapter.widht(10),),
                        Text(
                          "收藏",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.size(35)),
                        )
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '新闻详情',
            style: TextStyle(
                fontSize: ScreenAdapter.size(40), color: Colors.black87),
          ),
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black87,
            ),
            onPressed: () {
              Get.back();
            },
            color: Colors.black87,
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                _newDetail(),
              ],
            ),

            ///评论输入框 高度：220
            Positioned(
                width: ScreenAdapter.widht(1080),
                bottom: 0,
                left: 0,
                child: _commentBox())
          ],
        ));
  }
}
