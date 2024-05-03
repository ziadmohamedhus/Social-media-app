import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/BLOC/app-cubit.dart';
import 'package:social_media_app/BLOC/app-states.dart';
import 'package:social_media_app/COMPONENTS/navigators.dart';
import 'package:social_media_app/SCREANS/SETTINGS/update-screan.dart';

class Settings_screan extends StatelessWidget {
  const Settings_screan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var model=AppCubit.get(context).user_model;

        return Column(
          children: [
            //COVER + IMAGE
            Container(
              height: 260,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: NetworkImage(model!.cover.toString(),),fit: BoxFit.cover)
                      ),

                    ),
                  ),
                  CircleAvatar(
                    radius: 66,
                    //لون الخلفية
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(model!.image.toString()),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7,),
            Text(model.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 5,),
            Text(model.pio.toString(),style: TextStyle(color: Colors.grey,fontSize: 15),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Expanded(
                  child: Column(children: [
                    Text('100',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    SizedBox(height: 5,),
                    Text('posts',style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],),
                ),
                Expanded(
                  child: Column(children: [
                    Text('10k',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    SizedBox(height: 5,),
                    Text('followers',style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],),
                ),
                Expanded(
                  child: Column(children: [
                    Text('160',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    SizedBox(height: 5,),
                    Text('following',style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],),
                ),
                Expanded(
                  child: Column(children: [
                    Text('35',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    SizedBox(height: 5,),
                    Text('photos',style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],),
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),


                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: MaterialButton(onPressed: ()
                  {
                    Navigator_To(context, Update_screan());
                  },child: Text('UPDATE',style: TextStyle(fontSize: 20,color: Colors.white),),),
                ),
              ),
            ),



          ],
        );
      },

    );
  }
}