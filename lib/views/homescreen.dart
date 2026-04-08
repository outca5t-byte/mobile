import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../configs/colors.dart' as colors show secondaryColor;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: secondaryColor,
        buttonBackgroundColor: primaryColor,

        items: <Widget>[
          const Icon(Icons.dashboard, size: 30),

          GestureDetector(
            child: const Icon(Icons.shopping_cart, size: 30),
            onTap: () {
              Get.offAndToNamed("/cartscreen");
            },
          ),
          GestureDetector(
            child: const Icon(Icons.person, size: 30),
            onTap: () {
              Get.offAndToNamed("/profilescreen");
            },
          ),
          GestureDetector(
            child: const Icon(Icons.list, size: 30),
            onTap: () {
              Get.offAndToNamed("/productscreen");
            },
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),

      body: Padding(
        padding: EdgeInsets.all(15),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hi user"),

              Text("Products available"),

              Image.asset('assets/cinco.png', width: 400),
              SizedBox(height: 20),
              Image.asset('assets/inf.jpg', width: 400, height: 400),
              SizedBox(height: 20),
              Image.asset('assets/omni.jpg', width: 300),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.secondaryColor,
        title: Image.asset('assets/image.png', height: 70, width: 80),
      ),
    );
  }
}
