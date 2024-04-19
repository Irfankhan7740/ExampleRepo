import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todoapp/addSomeNewData.dart';
import 'package:todoapp/editData.dart';
import 'package:todoapp/editScreen.dart';
import 'package:todoapp/tabScreen.dart';
import 'package:todoapp/todoController.dart';

import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  TodoController todoController = Get.put(TodoController());

  final String title;

// TextEditingController user = TextEditingController();
//    TextEditingController dec  = TextEditingController();
  // TextEditingController mob  = TextEditingController();
  // TextEditingController upt  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text(title),
        centerTitle: true,
      ),
      body:
      GetBuilder<TodoController>(builder: (_) {
        return todoController.todoDetailsList.length==0 ?  Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Loading',)
          ],
        ),) : Column(
          children: [
            Container(
              height: 480,
              width: 450,
             decoration: BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.centerLeft,
                     end:  Alignment.centerRight,
                     colors: [Colors.green,Colors.blue]
                 )

             ),
              child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: todoController.todoDetailsList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Card(
                        elevation: 90,
                        child: Container(
                          margin: EdgeInsets.all(30),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter, colors: [Colors.blueGrey,Colors.blueAccent],


                            )
                          ),
                          width: 300,
                          height: 250,
                          // color: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 30,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    todoController.todoDetailsList[index].title.toString(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 25),
                                  ))),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 30,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    todoController.todoDetailsList[index].description.toString(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 25),
                                  ))),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 30,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    todoController.todoDetailsList[index].mobileNo.toString(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 25),
                                  ))),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  InkWell(
                                      onTap: () async{

                                        await todoController.deleteTodo(todoController
                                            .todoDetailsList[index].id!);
                                      },
                                      child: Card(
                                        elevation: 8,
                                        child: Container(

                                          padding: EdgeInsets.all(4),
                                          height: 30,
                                          width: 106,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end:  Alignment.centerRight,
                                                  colors: [Colors.green,Colors.blue]
                                              )
                                          ),

                                          child: Row(
                                            children: [
                                              Text("Delete Info"),
                                              Icon(Icons.delete),
                                            ],
                                          ),
                                        ),
                                      )),
                                  // InkWell(
                                  //     onTap: () {
                                  //       todoController.todoArgue =
                                  //           todoController
                                  //               .todoDetailsList[index];
                                  //
                                  //       Get.to(() => EditScreen(),
                                  //           arguments:
                                  //               todoController.todoArgue);
                                  //     },
                                  //     child: Card(
                                  //       elevation: 8,
                                  //       child: Container(
                                  //         padding: EdgeInsets.all(4),
                                  //         height: 30,
                                  //         width: 84,
                                  //         decoration: BoxDecoration(
                                  //             gradient: LinearGradient(
                                  //                 begin: Alignment.centerLeft,
                                  //                 end:  Alignment.centerRight,
                                  //                 colors: [Colors.green,Colors.blue]
                                  //             )
                                  //         ),
                                  //
                                  //         child: Row(
                                  //           children: [
                                  //             Text("Edit Info"),
                                  //             Icon(Icons.edit),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )),
                                  InkWell(
                                      onTap: () {
                                        todoController.todoArgue =
                                        todoController
                                            .todoDetailsList[index];

                                        Get.to(() => EditData(),
                                            arguments:
                                            todoController.todoArgue);
                                      },
                                      child: Card(
                                        elevation: 8,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          height: 30,
                                          width: 84,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end:  Alignment.centerRight,
                                                  colors: [Colors.green,Colors.blue]
                                              )
                                          ),

                                          child: Row(
                                            children: [
                                              Text("Edit Info"),
                                              Icon(Icons.edit),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => AddSomeNewData());
                },
                child: Card(
                  elevation: 40,
                  child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end:  Alignment.centerRight,
                              colors: [Colors.blueAccent,Colors.green,Colors.blueGrey]
                          )
                      ),

                      child: Center(child: Text('Add More',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),))),
                )),

          ],
        );
      }),
    );
  }
}
