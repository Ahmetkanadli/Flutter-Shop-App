import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/sigin_states.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/signin_events.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc() : super(const SignInState()){

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password: event.password));
  }

}