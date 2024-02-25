import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildThirdPartyLogin(BuildContext context){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 40.h,bottom: 20.h),
      padding: EdgeInsets.only(left: 35.w,right: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          reusableIcons("google"),
          reusableIcons("apple"),
          reusableIcons("facebook")
        ],
      ),
    ),
  );
}

Widget reusableIcons(String iconName){
  return GestureDetector(
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

