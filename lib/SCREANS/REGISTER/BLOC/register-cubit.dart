import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/MODELS/user-model.dart';
import 'package:social_media_app/SCREANS/REGISTER/BLOC/register-states.dart';

import '../../../COMPONENTS/navigators.dart';
import '../../HOME/home-page.dart';


class Register_Cubit extends Cubit<Register_States> {
  Register_Cubit() : super(Register_Initial_State());

  static Register_Cubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required context
  })async
  {
    emit(Register_Loding_State());

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        creatUser(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
        );

        emit(Register_Success_State());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success!")),);
        Navigator_To(context, Home_page());
      });




    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Register_Error_State());
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password provided is too weak!")),);

      } else if (e.code == 'email-already-in-use') {
        emit(Register_Error_State());
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The account already exists for that email!")),);

      }
    } catch (e) {
      emit(Register_Error_State());
      print(e);
    }


  }


  void creatUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })async
  {
    User_Model model=User_Model(
      name: name,
      email: email,
      phone: phone,
      image: 'https://img.freepik.com/free-photo/pretty-smiling-girl-keeps-both-hands-cheeks-smiles-broadly-being-good-mood-after-stroll-with-boyfriend_273609-44690.jpg?w=900&t=st=1695084006~exp=1695084606~hmac=fd1e42c35d236550b069bf76ef73858a9a50f8da7ecdf0b39165911f91aae0cd',
      cover: 'https://img.freepik.com/free-photo/stressed-beautiful-woman-keeps-fingers-temples-squints-face-with-displeasure-suffers-from-migraine-tries-concentrate-focus_273609-18252.jpg?t=st=1695076165~exp=1695076765~hmac=4be85a27e14bf5355ddea1ac0f56fc00f667c5fbf652fb9b0751fcf9c7acc833',
      pio: 'write your pio ...',
      uId: uId,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      emit(Creat_Success_State());
    }).catchError((error){
      emit(Creat_Error_State());
      print(error);
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(Register_password_State());
  }
}