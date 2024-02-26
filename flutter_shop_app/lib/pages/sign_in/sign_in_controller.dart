import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/pages/sign_in/bloc/singin_bloc.dart';
import 'package:flutter_shop_app/pages/welcome/widget/flutter_toast.dart';

class SingInController {
  final BuildContext context;

  const SingInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAdress = state.email;
        String password = state.password;

        if (emailAdress.isEmpty) {
          toastInfo(msg: "You need to fill email adress");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);

          if(credential.user == null){
            toastInfo(msg: "You don't exist");
            return;
          }
          if(credential.user!.emailVerified){
            toastInfo(msg: "You need verify your email adress");
            return;
          }

          var user = credential.user;

          if(user!=null){
            print('user exist');
          }
          else{
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }

        } on FirebaseAuthException catch (e) {
          if(e.code == 'user-not-found'){
            toastInfo(msg: "no user found for that email");
          }
          else if(e.code == 'wrong-password'){
            toastInfo(msg: "wrong password provided that user");
          }
          if(e.code=='invalid-email'){
            toastInfo(msg: "your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
