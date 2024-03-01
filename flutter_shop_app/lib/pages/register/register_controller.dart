import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:flutter_shop_app/pages/register/bloc/register_states.dart';
import 'package:flutter_shop_app/pages/welcome/widget/flutter_toast.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;


    if(userName.isEmpty){
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "User name can not be empty");
      return;
    }

    try{

      final crenditial = await FirebaseAuth.instance.
        createUserWithEmailAndPassword(email: email, password: password);

      if(crenditial.user != null){
        await crenditial.user?.sendEmailVerification();
        await crenditial.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent your email registered "
            "email adress. To active it please check your email box"
            " and click on the link");
        Navigator.of(context).pop();
      }

    }on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        toastInfo(msg: "The password provided is too week ");
      }
      else if(e.code == "email_already-in-use"){
        toastInfo(msg: "the email is already in use");
      }
    }

  }
}
