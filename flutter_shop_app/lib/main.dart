import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app/common/values/colors.dart';
import 'package:flutter_shop_app/firebase_options.dart';
import 'package:flutter_shop_app/pages/application/applicaiton_page.dart';
import 'package:flutter_shop_app/pages/application/widgets/applicaition_widget.dart';
import 'package:flutter_shop_app/pages/bloc_privders.dart';
import 'package:flutter_shop_app/pages/home/myHome.dart';
import 'package:flutter_shop_app/pages/register/register.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/singin_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/welcome.dart';
import 'package:flutter_shop_app/pages/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: AppColors.primaryText
                  )
                ),
                useMaterial3: true),
            home: ApplicationPage(),
            routes: {
              "myHonePage": (context) => const MyHomePage(),
              "signIn": (context) => const SingIn(),
              "register" : (context) => const Register()
            },
          ),
        ));
  }
}
