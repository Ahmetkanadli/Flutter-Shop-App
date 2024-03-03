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
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value){
                setState(() {
                  _index = value;
                });
                print(_index);
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
                      child: Image.asset("assets/icons/search.png"),
                    )
                ),
                BottomNavigationBarItem(
                    label: "search",
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset("assets/icons/search.png"),
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
