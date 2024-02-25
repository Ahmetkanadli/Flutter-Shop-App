
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/pages/home/myHome.dart';
import 'package:flutter_shop_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/welcome.dart';
import 'package:flutter_shop_app/pages/sign_in/sign_in.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context,child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white
            ),
            useMaterial3: true
          ),
          home: Welcome(),
          routes: {
            "myHonePage" : (context)=> const MyHomePage(),
            "signIn" : (context)=> const SingIn(),
          },
        ),
      )
    );
  }
}
