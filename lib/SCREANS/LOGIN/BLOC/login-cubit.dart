
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/SCREANS/LOGIN/BLOC/login-states.dart';

import '../../../COMPONENTS/navigators.dart';
import '../../HOME/home-page.dart';


class Login_Cubit extends Cubit<Login_States> {
  Login_Cubit() :super(Login_Initial_State());

  //to access al elements in class
  static Login_Cubit get(context) => BlocProvider.of(context);



  void Login_function({required String email,required String password,required context})async
  {
    emit(Login_Loding_State());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        emit(Login_Success_State(uId: value.user?.uid));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success!")),);

        //Navigator_To(context, Home_page());
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(Login_Error_State());
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email!")),);
      } else if (e.code == 'wrong-password') {
        emit(Login_Error_State());
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for that user!")),);
      }
    }
  }


  IconData suffix=Icons.remove_red_eye_outlined ;
  bool pass=true;
  void Change_icon_password()
  {

    pass=!pass;
    suffix=pass ? Icons.remove_red_eye_outlined :Icons.visibility_off_outlined ;
    emit(Login_password_State());
  }
}