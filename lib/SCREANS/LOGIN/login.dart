
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/COMPONENTS/components.dart';
import 'package:social_media_app/SCREANS/LOGIN/BLOC/login-cubit.dart';
import 'package:social_media_app/SCREANS/LOGIN/BLOC/login-states.dart';
import 'package:social_media_app/SCREANS/REGISTER/register.dart';

import '../../COMPONENTS/navigators.dart';
import '../../SHARED_PREFRANCE/shared-pre.dart';
import '../HOME/home-page.dart';

class Login_screan extends StatelessWidget {
   Login_screan({Key? key}) : super(key: key);

  TextEditingController email_controller=TextEditingController();//email
  TextEditingController password_controller=TextEditingController();//password
  var Submit_Key = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Login_Cubit(),
      child: BlocConsumer<Login_Cubit,Login_States>(
        listener: (BuildContext context, state) {
          if(state is Login_Success_State)
            {
              Cache_Helper.save_data(key: 'uId', value: state.uId).then((value) {
                uId=state.uId;
                Navigator_To_Remove(context, Home_page());
              });
            }
        },



        builder: (BuildContext context, Object? state) {
          return  Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: Submit_Key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
                      SizedBox(height: 10,),
                      Text('login now to browse our hot offers',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                      SizedBox(height: 30,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email_controller,
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            suffixIcon: Icon(Icons.check),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextFormField(
                        obscureText: Login_Cubit.get(context).pass,
                        keyboardType: TextInputType.text,
                        controller: password_controller,
                        validator:
                            ( value){
                          if (value!.isEmpty) {
                            return'please enter your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                             suffixIcon: IconButton(onPressed: (){
                              Login_Cubit.get(context).Change_icon_password();
                             }, icon: Icon(Login_Cubit.get(context).suffix),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                        ),
                      ),
                      SizedBox(height: 25.0,),
                      //Submit
                      if(state is! Login_Loding_State)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),


                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: MaterialButton(onPressed: ()
                            {
                              if (Submit_Key.currentState!.validate())
                              {
                                Login_Cubit.get(context).Login_function(email: email_controller.text, password: password_controller.text, context: context);

                              }
                            },child: Text('SUBMIT',style: TextStyle(fontSize: 30,color: Colors.white),),),
                          ),
                        )
                      else
                        Center(child: CircularProgressIndicator()),


                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator_To(context,Register_screan());
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
