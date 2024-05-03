import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/BLOC/app-cubit.dart';
import 'COMPONENTS/components.dart';
import 'SCREANS/HOME/home-page.dart';
import 'SCREANS/LOGIN/login.dart';
import 'SHARED_PREFRANCE/shared-pre.dart';
import 'firebase_options.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await Cache_Helper.init();

  uId= await Cache_Helper.get_data(key: 'uId');
  Widget widget;
  if(uId!=null)
  {
    widget=Home_page();
  }
  else{ widget=Login_screan(); }

  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.widget});
  Widget widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..get_user_data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Jannah',
        ),
        home: widget,
      ),
    );
  }
}

