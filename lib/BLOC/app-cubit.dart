
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/COMPONENTS/Icon_Broken.dart';
import 'package:social_media_app/COMPONENTS/components.dart';
import 'package:social_media_app/MODELS/user-model.dart';
import 'package:social_media_app/SCREANS/CHATS/chat-screan.dart';
import 'package:social_media_app/SCREANS/FEEDS/feeds-screan.dart';
import 'package:social_media_app/SCREANS/SETTINGS/settings-screan.dart';
import 'package:social_media_app/SCREANS/USERS/users-screan.dart';

import 'app-states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(App_Initial_State());

  static AppCubit get(context) => BlocProvider.of(context);


  int current_index = 0;

  List<BottomNavigationBarItem> bottomItems = [

    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Users'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];
  List<Widget> screans = [

    Feeds_screan(),
    Chat_screan(),
    Users_screan(),
    Settings_screan(),
  ];
  List<String> titles = [

    'Home',
    'Chats',
    'Users',
    'Settings',
  ];

  void changebottomnav(int index) {
    current_index = index;
    emit(App_bottomnav_state());
  }

User_Model? user_model;
  void get_user_data()
  {
    emit(Get_Userdata_Loding_State());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      user_model=User_Model.fromJson(value.data());
      print(value.data());
      emit(Get_Userdata_Success_State());
    }).catchError((error){
      emit(Get_Userdata_Error_State());
      print(error);
    });
  }
}