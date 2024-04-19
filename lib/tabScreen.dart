
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
   TabScreen({super.key});
   List items = [
     {
       "name" : "(Commercia)",
       "hello": "Total &9823",
       "comp": "Completed",
   "color" :  Colors.green,
       "left": "",
       "leftColor":Colors.red,
      },
     {
       "name" : "(Non-Commercial)",
       "hello": "Total &2387",
       "comp": "Completed",
       "color" :  Colors.green,
       "left": "",
       "leftColor":Colors.red,
       },
     {
       "name" : "",
       "hello":  "",
       "comp": "Cancelled",
       "color" :  Colors.red,
       "left": "",
       "leftColor":Colors.red,

      },

     {
       "name" : "(Commercial)",
       "hello":  "",
       "comp": "Cancelled",
       "color" :  Colors.red,
       "left": "",
       "leftColor":Colors.red,
     },
     {
       "name" : "(Commercial)",
       "hello": "",
       "comp": "Completed",
       "color" :  Colors.green,
       "left": "",
       "leftColor": Colors.red,
     },

     {
       "name" : "",
       "hello": "Total & 3265",
     "color" :  Colors.blue,
       "comp": "On Going",
       "leftColor": Colors.red,
       "left": "left &224",

     },
   ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(





            body: SafeArea(

              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(

                            height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueGrey.shade50,
                              ),

                              child: Icon(Icons.arrow_back)),
                          SizedBox(width: 15,),
                          Text("Projects",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 7),
                          child: Container(
                            height: 40,

                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.blueGrey.shade50,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0,left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text("Search"),
                                Icon(Icons.search)
                              ],),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0 ,left: 18,top: 8,bottom: 14),
                          child: Container(
                            height: 40,


                            // margin: EdgeInsets.all(10),
                            // padding: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.blueGrey.shade100,
                            ),

                            child: TabBar(


                              labelColor: Colors.black, //<-- selected text color
                              unselectedLabelColor: Colors.black,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                  boxShadow: [BoxShadow(
                                    blurStyle: BlurStyle.solid,
                                    color: Colors.black45,
                                    blurRadius: 15.0,
                                  ),]


                              ),



                              tabs: [
                              Text("All",style: TextStyle(fontSize: 10.45),),
                                Text("Assigned",style: TextStyle(fontSize: 10.45),),
                                Text("Completted",style: TextStyle(fontSize: 10.45),),
                                Text("Cancelled",style: TextStyle(fontSize: 10.45),),



                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 15),
                            child: ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
                       scrollDirection: Axis.vertical,
                       itemCount: items.length,
                      itemBuilder: (context, index) {
                        return
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:AssetImage("assets/image/IMG_0769.jpeg") ),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("Project Name",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                                    Text(items[index]["name"],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),

                                                  ],
                                                ),
                                                Text("John Doe | Lahore")
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Icon(Icons.more_vert),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,

                                          children: [
                                            Text(items[index]["hello"],style: TextStyle(color: Colors.blueAccent,fontSize: 12),),
                                            if(items[index]["left"] != "")...{
                                              Text(items[index]["left"],style: TextStyle(color: items[index]["leftColor"],fontSize: 12),),
                                            }

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Text("Status"),
                                            SizedBox(width: 10,),
                                            Text(items[index]["comp"],style: TextStyle(color: items[index]["color"]),),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 6.0),
                                        child: Text("Oct 2, 2020"),
                                      )



                                    ],),
                                  Divider(


                                    thickness: 1,
                                    indent : 10,
                                    endIndent : 10,
                                  ),
                                ],
                              ),
                            );} ),
                          ),



                          Container(
                            height: 500,
                            width: size.width,
                            color: Colors.yellow,
                          ),
                          Container(
                            height: 500,
                            width: size.width,
                            color: Colors.red,
                          ),
                          Container(child: Text(""),
                            height: 500,
                            width: size.width,
                            color: Colors.greenAccent,
                          ),

                        ],
                      ),
                    ), // T
                  ],
                ),
              ),
            ),

          );
  }
}
