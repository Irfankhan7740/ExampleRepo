

import 'dart:convert';

List<TodosModel> todosModelFromJson(String str) => List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todosModelToJson(List<TodosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosModel {
  String? title;
  String? description;
  String? mobileNo;
  String? id;

  TodosModel({
    this.title,
    this.description,
    this.mobileNo,
    this.id,
  });

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
    title: json["title"],
    description: json["description"],
    mobileNo: json["mobileNo"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "mobileNo": mobileNo,
    "id": id,
  };
}
