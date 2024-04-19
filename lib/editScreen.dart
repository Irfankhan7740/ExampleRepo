import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/todoController.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    TextEditingController edit = TextEditingController();
    TextEditingController editDes = TextEditingController();
    TextEditingController mobile = TextEditingController();
    return Scaffold(
        body: Container(
      color: Colors.blueGrey,
      child: Center(
        child: Card(
          elevation: 40,
          child: SingleChildScrollView(
            child: Container(

              height: 390,
              width: 300,
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end:  Alignment.topCenter,
                      colors: [Colors.grey,Colors.blue,]
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 12,
                    child: Container(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)

                        ),
                        child: TextFormField(
                          controller: edit,
                          decoration: InputDecoration(hintText: " Edit title"),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: Container(
                      height: 60,

                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),


                      ),
                      child: TextFormField(
                        controller: editDes,
                        decoration: InputDecoration(hintText: " Edit description"),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: Container(
                      height: 60,

                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),


                      ),
                      child: TextFormField(
                        controller: mobile,
                        decoration: InputDecoration(hintText: " Edit Mobile No."),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end:  Alignment.centerRight,
                            colors: [Colors.black,Colors.white,]
                        )
                    ),
                    child: Container(
                      height: 30,
                      width: 90,
                      margin: EdgeInsets.all(1),

                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end:  Alignment.centerRight,
                              colors: [Colors.green,Colors.blue,]
                          )
                      ),
                      child: InkWell(
                          onTap: () {
                            todoController.putTodo(
                                edit.text, editDes.text,mobile.text, todoController.todoArgue.id!);
                            Get.back();
                          },
                          child: Center(child: Text("Change data",style: TextStyle(fontWeight: FontWeight.w600),))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
