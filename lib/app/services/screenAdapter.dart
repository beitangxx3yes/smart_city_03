import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static height(num value)=>value.h;
  static widht(num value)=>value.w;
  static size(num value)=>value.sp;
  static getScreenWidht ()=>ScreenUtil().scaleWidth;
  static getScreenHeight ()=>ScreenUtil().scaleHeight;

}