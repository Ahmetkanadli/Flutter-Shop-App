
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/common/routes/routes.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_shop_app/pages/register/register.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/singin_bloc.dart';
import 'package:flutter_shop_app/pages/sign_in/sign_in.dart';
import 'package:flutter_shop_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/welcome.dart';

class AppPages{
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route : AppRoutes.INITIAL,
          page : const Welcome(),
          bloc : BlocProvider(create: (_)=> WelcomeBloc())
      ),
      PageEntity(
          route : AppRoutes.SIGN_IN,
          page : const SingIn(),
          bloc : BlocProvider(create: (_)=> SignInBloc())
      ),
      PageEntity(
          route : AppRoutes.REGISTER,
          page : const Register(),
          bloc : BlocProvider(create: (_)=> RegisterBloc())
      ),
      PageEntity(
        route : AppRoutes.APPLICATION,
        page : const Welcome(),
        bloc : BlocProvider(create: (_)=> RegisterBloc())
      ),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];

    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      var result = routes().where((element) => element.route == settings.name);

      if(result.isNotEmpty){
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }

    }
    return MaterialPageRoute(builder: (_)=> const SingIn(),settings: settings);
  }
}



class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}