
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLOC/app-cubit.dart';
import '../../BLOC/app-states.dart';

class Update_screan extends StatelessWidget {

  TextEditingController name_controller=TextEditingController();//email
  TextEditingController phone_controller=TextEditingController();
  TextEditingController bio_controller=TextEditingController();//password
  var Submit_Key = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var model=AppCubit.get(context).user_model;
        return Scaffold(
          appBar: AppBar(title:Text('Update account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), backgroundColor: Colors.transparent,elevation: 0,
            actions: [
              TextButton(onPressed: (){},
                  child: Text('UPDATE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
              SizedBox(width: 15,),

            ],
          ),
          body: SingleChildScrollView(child: Column(
            children: [
              //COVER + IMAGE
              Container(
                height: 260,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(image: NetworkImage(model!.cover.toString(),),fit: BoxFit.cover)
                            ),

                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera_back))
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 66,
                      //لون الخلفية
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(model!.image.toString()),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera_front_outlined,color: Colors.black,))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                keyboardType: TextInputType.text,
                controller: bio_controller,
                validator:
                    ( value){
                  if (value!.isEmpty) {
                    return'please enter your bio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'BIO',
                    hintText: 'Enter your bio',
                    prefixIcon: Icon(Icons.info_outline),
                    //suffixIcon: Icon(Icons.check),
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
            ],
          )),
        );
      },

    );
  }
}
