import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/common/values/colors.dart';
import 'package:flutter_shop_app/pages/application/widgets/applicaition_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index =0;
  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ]
            ),
            child: BottomNavigationBar(
                currentIndex: _index,
                onTap: (value){
                  setState(() {
                    _index = value;
                  });
                },

                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    label: "home",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset("assets/icons/home.png"),
                      )
                  ),

                  BottomNavigationBarItem(
                      label: "search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset("assets/icons/search.png"),
                      )
                  ),
                  BottomNavigationBarItem(
                      label: "search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset("assets/icons/play-circle1.png"),
                      )
                  ),
                  BottomNavigationBarItem(
                      label: "search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset("assets/icons/message-circle.png"),
                      )
                  ),
                  BottomNavigationBarItem(
                      label: "search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset("assets/icons/person2.png"),
                      )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
