import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(

          child:  Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                appBar: buildAppBar("Sign up"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      Center(child: reusableText("Enter yor details below and free sign up")),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("User Name"),
                            //hinText , textType , iconName
                            buildTexField("Enter your user name", "email","user",
                                    (value){
                                  //  context.read<SignInBloc>().add(EmailEvent(value));
                                }
                            ),
                            reusableText("Email"),
                            //hinText , textType , iconName
                            buildTexField("Enter your email adress", "name","user",
                                    (value){
                                //  context.read<SignInBloc>().add(EmailEvent(value));
                                }
                            ),
                            reusableText("Password"),
                            SizedBox(height: 5.h,),
                            buildTexField("Enter your password", "password","lock",
                                    (value){
                              //    context.read<SignInBloc>().add(PasswordEvent(value));
                                }
                            ),
                            reusableText("Confirm Password"),
                            SizedBox(height: 5.h,),
                            buildTexField("Re-enter your password", "password","lock",
                                    (value){
                                  //    context.read<SignInBloc>().add(PasswordEvent(value));
                                }
                            ),
                            Center(
                              child: buildLoginAndRegisterButton("Sign up", "login", () {

                              }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

    );
  }
}
