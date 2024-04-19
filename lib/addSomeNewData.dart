import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todoapp/todoController.dart';

import 'package:get/get.dart';

class AddSomeNewData extends StatefulWidget {
  AddSomeNewData({super.key});

  @override
  State<AddSomeNewData> createState() => _AddSomeNewDataState();
}

class _AddSomeNewDataState extends State<AddSomeNewData>
    with WidgetsBindingObserver {
  @override
  void iniState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycle(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state.name);
  }

  bool singleTap = false;
  bool _autoValidate = false;

  TodoController todoController = Get.put(TodoController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController mobileNo = TextEditingController();
    // TextEditingController upt  = TextEditingController();
    return Scaffold(
      body: todoController.todoDetailsList.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text('Loading')],
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Card(
                        elevation: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue,
                                Colors.green,
                                Colors.blueGrey
                              ],
                            ),
                          ),
                          height: 700,
                          width: 400,
                          // color: Colors.blueGrey,
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: _formKey,
                            // autovalidateMode: todoController.autoValidateMode.value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Center(child: Text("sjdjsh")),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      elevation: 12,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 37,
                                            left: 10,
                                            bottom: 0,
                                            top: 10),
                                        height: 110,
                                        width: 284,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            Text(
                                              "Product Name",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              controller: title,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Enter Product Name"),
                                              validator: (xyz) =>
                                                  xyz!.length < 1
                                                      ? "Fill Proper Detail"
                                                      : null,
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                // Center(child: Text("sjdjsh")),/
                                Card(
                                  elevation: 12,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        bottom: 0,
                                        top: 10),
                                    height: 110,
                                    width: 310,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "About Product",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: description,
                                          decoration: InputDecoration(
                                              hintText: "Put Detail Here"),
                                          validator: (title) =>
                                              title!.length < 1
                                                  ? "Fill Proper Detail"
                                                  : null,
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 12,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        bottom: 0,
                                        top: 10),
                                    height: 110,
                                    width: 310,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Your Contact Info.",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        TextFormField(
                                          controller: mobileNo,
                                          decoration: InputDecoration(
                                              hintText: "Enter mobile number"),
                                          validator: (title) =>
                                              title!.length < 1
                                                  ? "Fill Proper Detail"
                                                  : null,
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                                InkWell(
                                    onTap: () async {
                                      if (!singleTap) {
                                        singleTap = true;
                                        if (_formKey.currentState!.validate()) {
                                          await todoController.PostTodos(
                                              title.text,
                                              description.text,
                                              mobileNo.text);

                                          setState(() {
                                            _autoValidate = true;
                                          });
                                          // todoController.autoValidateMode.value;
                                        } else {
                                          Get.snackbar(
                                              "Error", "Validation Error");
                                        }
                                      } else {
                                        Get.snackbar("Error", "Tap only Once");
                                      }
                                      Get.back();
                                    },
                                    child: Card(
                                      elevation: 12,
                                      child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                Colors.blue,
                                                Colors.green,
                                                Colors.blueGrey
                                              ])),
                                          child: Center(
                                              child: Text(
                                            "Enter Data",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ))),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
