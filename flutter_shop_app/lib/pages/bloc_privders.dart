import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/singin_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context)=> RegisterBloc()),
  ];
}