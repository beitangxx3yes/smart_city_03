import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/citySubway/bindings/city_subway_binding.dart';
import '../modules/citySubway/views/city_subway_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_detail_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/feedback_view.dart';
import '../modules/user/views/order_view.dart';
import '../modules/user/views/re_password_view.dart';
import '../modules/user/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.REPASSWORD,
      page: () => const RePasswordView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.NEWSDETAIL,
      page: () => const NewsDetailView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.CITY_SUBWAY,
      page: () => const CitySubwayView(),
      binding: CitySubwayBinding(),
    ),
  ];
}
