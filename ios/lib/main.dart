import 'package:flutter/material.dart';
import 'package:gallery/main_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(UsersApp());
}

class Controller extends GetxController {
  var url;
  dynamic user;
  Controller({this.url, this.user});
  var urlData;
  String titleText = 'UsersApp';
}

class UsersApp extends StatelessWidget {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: controller.titleText,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(child: Text(controller.titleText)),
          ),
          body: MainScreen()),
    );
  }
}
