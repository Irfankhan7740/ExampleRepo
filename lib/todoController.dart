import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:todoapp/apiService.dart';
import 'package:todoapp/todoModel.dart';

class TodoController extends GetxController {
  ApiService apiService = ApiService();
  var todoList = <TodosModel>[].obs;
  TodosModel todoArgue = TodosModel();
  var isLoading = false.obs;
 var autoValidateMode = AutovalidateMode.disabled.obs;


  @override
  void onInit() {
    getTodos();

    super.onInit();
  }

  List<TodosModel> todoDetailsList = [];



  getTodos()async{
    isLoading.value = true;
    var response = await apiService.getTodos();
    if(response != null){
      if(response.statusCode == 200){

        String jsonData = json.encode(response.body);

        todoDetailsList = todosModelFromJson(jsonData);
        isLoading.value = false;


        update();
      }
    }

  }

  Future<void> PostTodos(String title , String description, String mobileNo)async {
    final response = await http.post(Uri.parse("https://66161535b8b8e32ffc7c528d.mockapi.io/api/userData"),

        body :
        { "title": title,"description": description ,"mobileNo" : mobileNo}
    );


    if (response.statusCode==201){
      print("done");
      getTodos();


    }else{
      print("Failed");
    }
  }

  Future<Response?> putTodo(String title,String description,String mobileNo, String id) async {
    final response = await http.put(
        Uri.parse('https://66161535b8b8e32ffc7c528d.mockapi.io/api/userData/$id'),
        body: {
          'title': title , "description": description ,"mobileNo" : mobileNo,
        });

    if (response.statusCode == 200) {
      getTodos();

      String jsonData = json.encode(response.body);

      todoDetailsList = todosModelFromJson(jsonData);
    } else {
     print('Failed');
    }

  }

  Future<void> deleteTodo(String id)async {
    final response = await http.delete(Uri.parse("https://66161535b8b8e32ffc7c528d.mockapi.io/api/userData/$id"),

    );
    if (response.statusCode==200){

      todoDetailsList.clear();
      getTodos();
      update();
    }else{
      print("Failed");
    }
  }


  }

