
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/COMPONENTS/navigators.dart';
import 'package:social_media_app/SCREANS/HOME/home-page.dart';
import 'BLOC/register-cubit.dart';
import 'BLOC/register-states.dart';

class Register_screan extends StatelessWidget {

  TextEditingController name_controller=TextEditingController();//email
  TextEditingController email_controller=TextEditingController();
  TextEditingController phone_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();//password
  var Submit_Key = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Register_Cubit(),
      child: BlocConsumer<Register_Cubit,Register_States>(

        listener: (BuildContext context, Object? state) {},

        builder: (BuildContext context, state) { return  Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: Submit_Key,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('REGISTER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
                    SizedBox(height: 10,),
                    Text('register now to browse our hot offers',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 30,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: name_controller,
                      validator:
                          ( value){
                        if (value!.isEmpty) {
                          return'please enter your name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'NAME',
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.person),
                          //suffixIcon: Icon(Icons.check),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                    ),
                    SizedBox(height: 15.0,),
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
                      obscureText: Register_Cubit.get(context).isPassword,
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
                            Register_Cubit.get(context).changePasswordVisibility();

                          }, icon: Icon(Register_Cubit.get(context).suffix),),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phone_controller,
                      validator:
                          ( value){
                        if (value!.isEmpty) {
                          return'please enter your phone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'PHONE',
                          hintText: 'Enter your phone',
                          prefixIcon: Icon(Icons.phone),

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                    ),
                    SizedBox(height: 25.0,),
                    //Submit
                    if(state!=Register_Loding_State)
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
                              Register_Cubit.get(context).userRegister(name: name_controller.text, email: email_controller.text, password: password_controller.text, phone: phone_controller.text,context: context);



                            }
                          },child: Text('SUBMIT',style: TextStyle(fontSize: 30,color: Colors.white),),),
                        ),
                      )
                    else
                      Center(child: CircularProgressIndicator()),





                  ],
                ),
              ),
            ),
          ),
        );},

      ),
    );
  }
}
