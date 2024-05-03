
import 'package:flutter/material.dart';

class Feeds_screan extends StatelessWidget {
  const Feeds_screan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 15,
              margin: EdgeInsets.all(8),
              child: Stack(
                alignment:Alignment.centerRight,
                children: [
                  Image(image: NetworkImage('https://img.freepik.com/free-photo/cheerful-positive-young-european-woman-with-dark-hair-broad-shining-smile-points-with-thumb-aside_273609-18325.jpg?w=900&t=st=1695075566~exp=1695076166~hmac=e66118028d65804baeb2997394db6efe03f4836c6b9eb6a2915da1b9d75a2b28'),
                    fit: BoxFit.cover,
                    height: 200,
                  width: double.infinity,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Post with your friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),

          ListView.separated(
            // BECAUSE IAM IN COLUMN WITH SINGLECHILDSCROLLVIEW
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index)=>build_post_item(context),
            itemCount: 10,
            separatorBuilder: ( context,  index) =>SizedBox(height: 10,),
          )

        ],
      ),
    );
  }
  Widget build_post_item(context)
  {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //information
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/pretty-smiling-girl-keeps-both-hands-cheeks-smiles-broadly-being-good-mood-after-stroll-with-boyfriend_273609-44690.jpg?w=900&t=st=1695076165~exp=1695076765~hmac=e7786005f0771a9ffe629003851566de1765f94b73b76a54c05a37471ace4ffe'),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ziad Mohamed',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('january 23,2023 at 11:00 pm',style: TextStyle(color: Colors.grey,fontSize: 13),),
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
              ],
            ),
            //divider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1,
              ),
            ),
            //content
            Text('Learning a little each day adds up. Research shows that students who make learning a habit are more likely to reach their goals. Set time aside to learn and get reminders using your learning scheduler.',style: TextStyle(fontSize: 18),),
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/stressed-beautiful-woman-keeps-fingers-temples-squints-face-with-displeasure-suffers-from-migraine-tries-concentrate-focus_273609-18252.jpg?t=st=1695076165~exp=1695076765~hmac=4be85a27e14bf5355ddea1ac0f56fc00f667c5fbf652fb9b0751fcf9c7acc833',),fit: BoxFit.cover)
              ),

            ),
            //likes & comments
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){  },
                      child: Row(children: [
                        Icon(Icons.favorite_border,color: Colors.red,),
                        SizedBox(width: 5,),
                        Text('130',style: TextStyle(color: Colors.grey[700]),),
                      ],),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.chat_outlined,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text('50 comment',style: TextStyle(color: Colors.grey[700]),),
                        ],),
                    ),
                  ),
                ],
              ),
            ),
            //divider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1,
              ),
            ),
            //make comment
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/pretty-smiling-girl-keeps-both-hands-cheeks-smiles-broadly-being-good-mood-after-stroll-with-boyfriend_273609-44690.jpg?w=900&t=st=1695076165~exp=1695076765~hmac=e7786005f0771a9ffe629003851566de1765f94b73b76a54c05a37471ace4ffe'),
                ),
                SizedBox(width: 15,),
                InkWell(onTap: (){},child: Text('write comment ...',style: TextStyle(color: Colors.grey[700]),)),
                Spacer(),
                GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.favorite_border,color: Colors.red,)
                ),

              ],),
            )
          ],
        ),
      ),


    );
  }
}
