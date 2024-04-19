import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todoapp/addSomeNewData.dart';
import 'package:todoapp/editScreen.dart';
import 'package:todoapp/homePage.dart';
import 'package:todoapp/todoController.dart';

import 'package:get/get.dart';
class EditData extends StatelessWidget {
  EditData({super.key});
  TodoController todoController = Get.put(TodoController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController edit = TextEditingController();

    TextEditingController editDes = TextEditingController();
    TextEditingController mobile = TextEditingController();

    return Scaffold(
      body:  Center(
        child: SingleChildScrollView(
          child: Container(
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
                    InkWell(
                      onTap: (){
                        Get.bottomSheet( SingleChildScrollView(
                          child: Container(
                            height: 280,
                            width: 400,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),


                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: edit,
                                    decoration: InputDecoration(hintText: " Edit Prodct Name",
                                    ),
                                    validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,
                                  ),
                                  TextFormField(
                                    controller: editDes,
                                    decoration: InputDecoration(hintText: " Edit Product Detail"
                                    ),
                                    validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,
                                  ),
                                  TextFormField(
                                    controller: mobile,
                                    decoration: InputDecoration(hintText: " Edit Mobile No"),
                                    validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,
                                  ),
                                  SizedBox(height: 20,),
                                  InkWell(
                                      onTap: () {
                                        if(_formKey.currentState!.validate()){
                                          todoController.putTodo(
                                              edit.text, editDes.text,mobile.text, todoController.todoArgue.id!);

                                          Get.to(MyHomePage(title:""));
                                        } else {
                                          Get.snackbar("Error","Validation Error");
                                        }

                                      },
                                      child: Container(
                                          height: 30,
                                          width: 90,
                                          color: Colors.blueGrey,



                                          child: Center(child: Text("Change data",style: TextStyle(fontWeight: FontWeight.w600),)))),

                                ],
                              ),
                            ),
                          ),
                        ));

                      },
                      child: Container(
                          height: 30,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                                todoController.todoArgue.title.toString(),
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 25),
                              ))),
                    ),
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
                              todoController.todoArgue.description.toString(),
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
                              todoController.todoArgue.mobileNo.toString(),
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 25),
                            ))),
                    SizedBox(height: 30,),
                    InkWell( onTap: (){
                      Get.bottomSheet( SingleChildScrollView(
                        child: Container(
                          height: 280,
                          width: 400,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),


                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: edit,
                                  decoration: InputDecoration(hintText: " Edit Prodct Name"),
                                  validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,

                                ),
                                TextFormField(
                                  controller: editDes,
                                  decoration: InputDecoration(hintText: " Edit Product Detail"),
                                  validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,

                                ),
                                TextFormField(
                                  controller: mobile,
                                  decoration: InputDecoration(hintText: " Edit Mobile No"),
                                  validator: (title) => title!.length < 1 ? "Fill Proper Detail": null,

                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        todoController.putTodo(
                                            edit.text,
                                            editDes.text,
                                            mobile.text,
                                            todoController.todoArgue.id!);

                                        Get.to(MyHomePage(title: ""));
                                      } else {
                                        Get.snackbar(
                                            "Error", "Validation Error");
                                      }
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 90,
                                        color: Colors.blueGrey,



                                        child: Center(child: Text("Change data",style: TextStyle(fontWeight: FontWeight.w600),)))),

                              ],
                            ),
                          ),
                        ),
                      ));

                    },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        height: 30,
                        width: 84,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end:  Alignment.centerRight,
                                colors: [Colors.white,Colors.blue]
                            )
                        ),

                        child: Row(
                          children: [

                            Text("Edit Info"),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ),
        ),
      ),
    );
  }

}
