
import 'package:flutter/material.dart';
import 'package:todoapp/addSomeNewData.dart';
import 'package:todoapp/editScreen.dart';
import 'package:todoapp/homePage.dart';
import 'package:todoapp/tabScreen.dart';
class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int selectedIndex = 0;
  List Pages = [
   AddSomeNewData(),
    TabScreen(),
    EditScreen(),
    MyHomePage(title: '',),

    TabScreen(),
  ];
  bool isChange = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectedIndex],
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 60,
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=0;
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade300,


                        child: Icon(Icons.upcoming_sharp,color : selectedIndex==0 ? Colors.blue : Colors.black54,)),

                  ],
                ),
              ),


              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=1;
                    isChange = !isChange;
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,

                      child: Icon(Icons.person,
                        color : selectedIndex==1 ? Colors.blue : Colors.black54,),
                    ),


                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=2;
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.black45,

                      child: CircleAvatar(
                          radius: 20,

                          backgroundColor: Colors.grey.shade300,

                          child: Icon(Icons.home,color : selectedIndex==2 ? Colors.blue : Colors.black54,)),
                    ),

                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=3;
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade300,

                        child: Icon(Icons.tab_outlined,color : selectedIndex== 3 ?Colors.blue : Colors.black54,)),

                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=4;
                  });
                },
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey.shade300,

                        child: Icon(Icons.tab_outlined,color : selectedIndex== 4 ?Colors.blue : Colors.black54,)),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
