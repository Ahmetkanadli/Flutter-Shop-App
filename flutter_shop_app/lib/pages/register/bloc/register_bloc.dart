import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_event.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterStates>{
  RegisterBloc() : super(RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);

  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates>emit){
    print(state.userName);
    emit(state.copywith(userName : event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates>emit){
    print(state.email);
    emit(state.copywith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates>emit){
    print(state.password);
    emit(state.copywith(password :event.password));
  }
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates>emit){
    print(state.rePassword);
    emit(state.copywith(rePassword: event.rePassword));
  }
}