
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_city_03/app/services/screenAdapter.dart';
import 'package:smart_city_03/app/services/storage.dart';
import 'package:video_player/video_player.dart';


class UserController extends GetxController {
  //TODO: Implement UserController

  ///用户信息
  RxMap userInfo = {}.obs;





  ///是否显示导航栏标题
  RxBool showAppBarTitle = false.obs;

  ///滑动控制
  ScrollController scrollController = ScrollController();

  ///头部背景视频
    VideoPlayerController videoPlayerController = VideoPlayerController.file(File(""));

  ///初始化头部背景视频
   initVideo() {
    videoPlayerController = VideoPlayerController.file(videoFile);
    videoPlayerController.initialize().then((_) {
    });
     videoPlayerController.setVolume(0);
     videoPlayerController.addListener(() {
       if (videoPlayerController.value.position >=
           videoPlayerController.value.duration) {
         // If video reaches the end, seek to the beginning and start playing again
         videoPlayerController.seekTo(Duration.zero);
         videoPlayerController.play();
       }
     });
    videoPlayerController.play();
  }


  ///背景是否为视频
  RxString appBarBackGroundType = "".obs;

  ///imagePicker
  ImagePicker picker = ImagePicker();
  ///图片/视频地址
  late File imageFile ;
  late File videoFile ;







  ///获取用户信息
  void getUserInfo() async{
    userInfo.value = await Storage.getData("userInfo");

  }

  ///初始化scrollerContaeorller
  initScrollowControllerLis() {
    var height = ScreenAdapter.height(500);

    scrollController.addListener(() {
      if (scrollController.position.pixels > height && !showAppBarTitle.value) {
        showAppBarTitle.value = true;
      } else if (scrollController.position.pixels < height &&
          showAppBarTitle.value) {
        showAppBarTitle.value = false;
      }
    });
  }

  ///从相册中选取图片/视频作为背景
  void selectImage(String type) async{

  PermissionStatus cameraPer = await Permission.camera.request();

  if(cameraPer!= PermissionStatus.granted){
    Fluttertoast.showToast(msg: "相册访问失败，无访问权限");
    return;
  }

  if(videoPlayerController.value.isInitialized){
    videoPlayerController.dispose();
  }

  if(type == "image"){
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      String path = pickedFile!.path;
      imageFile =File(path);
      appBarBackGroundType.value = "image";
      videoPlayerController.dispose();
      Get.back();
      update();
    }else{
      Fluttertoast.showToast(msg: "未选择图片");
    }
    return ;
  }
  if(type == "video"){
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if(pickedFile!=null){
      String path = pickedFile!.path;
      videoFile =File(path);
      Get.back();
      initVideo();
      appBarBackGroundType.value = "video";
      update();

    }else{
      Fluttertoast.showToast(msg: "未选择视频");
    }
    return ;
  }
  }

  Future<bool> requestPermission(Permission permission) async {
    //发起权限申请
    PermissionStatus status = await permission.request();
    // 返回权限申请的状态 status
    print('权限状态$status');
    // if (status.isPermanentlyDenied) {
    //   openAppSettings();
    // }

    if(status!=PermissionStatus.granted){
      return false;
    }
    return true;

  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    initScrollowControllerLis();;
  }

  @override
  void onClose() {
    super.onClose();

    // videoPlayerController.dispose();
  }

}
