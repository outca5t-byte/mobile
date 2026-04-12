import 'package:flutter/material.dart';

import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "/", //specify first route
      getPages: routes, // specify where flutter will get routes
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
  final CartController cartController = Get.put(CartController());
}
// created 4 news folders under lib called  configs, controllers, models and views
// created a file in configs called colors.dart