import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/common_widgets.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/sigin_states.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/signin_events.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/singin_bloc.dart';
import 'package:flutter_shop_app/pages/sign_in/sign_in_controller.dart';


class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc,SignInState>(
      builder: (context,state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar("Log In"),
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
                          buildTexField("Enter your email adress", "email","user",
                              (value){
                                context.read<SignInBloc>().add(EmailEvent(value));
                              }
                          ),
                          reusableText("Password"),
                          SizedBox(height: 5.h,),
                          buildTexField("Enter your password", "password","lock",
                                  (value){
                                context.read<SignInBloc>().add(PasswordEvent(value));
                              }
                          ),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLoginAndRegisterButton("Log in","login",
                        (){
                          SingInController(context:context).handleSignIn("email");

                        }
                    ),
                    buildLoginAndRegisterButton("Register","register",
                        (){
                          Navigator.of(context).pushNamed("register");
                        }

                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
