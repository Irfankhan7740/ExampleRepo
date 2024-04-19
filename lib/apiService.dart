
import 'package:get/get_connect/connect.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:todoapp/todoModel.dart';

class ApiService extends GetConnect{
  var todoList = RxList<TodosModel>();


  @override
  void onInit(){
    getTodos();
    super.onInit();
  }
  Future<Response?> getTodos() {
    return get("https://66161535b8b8e32ffc7c528d.mockapi.io/api/userData");

  }





}