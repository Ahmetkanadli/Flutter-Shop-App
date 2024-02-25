import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/pages/sign_in/widget/buildThirdPartyLogin.dart';
import 'package:flutter_shop_app/pages/sign_in/widget/sign_in_widget.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText("Or use your email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(height: 5.h,),
                      //hinText , textType , iconName
                      buildTexField("Enter your email adress", "email","user"),
                      reusableText("Password"),
                      SizedBox(height: 5.h,),
                      buildTexField("Enter your password", "password","lock"),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLoginAndRegisterButton("Log in","login"),
                buildLoginAndRegisterButton("Register","register")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
