
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/BLOC/app-cubit.dart';
import 'package:social_media_app/BLOC/app-states.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {

        var cubit=AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title:Text(cubit.titles[cubit.current_index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.transparent,elevation: 0,
            actions: [
              IconButton(onPressed: (){

              }, icon: Icon(Icons.search,color: Colors.black,),),

              IconButton(onPressed: (){

              }, icon: Icon(Icons.notifications_active_sharp,color: Colors.black,),),
            ],
          ),
          body: ConditionalBuilder(
            condition: AppCubit.get(context).user_model!=null,
            builder: (BuildContext context) =>Scaffold(
              body:cubit.screans[cubit.current_index],

              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.current_index,
                onTap: (index)
                {
                  cubit.changebottomnav(index);
                },
                items: cubit.bottomItems,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
          ),

        );
      },

    );
  }
}
