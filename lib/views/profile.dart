import 'package:flutter/material.dart';

import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/colors.dart' as colors;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              AppBar(
                title: Image.asset('assets/image.png', height: 70, width: 80),
                backgroundColor: colors.secondaryColor,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: buttonColor,
                    radius: 50,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Hi User. Here is what we know about you",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text("Name"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Email Address"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Text("Address"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Phone Number"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 30),

              SizedBox(height: 20),

              GestureDetector(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(242, 244, 190, 13),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Home", style: TextStyle(color: Colors.white)),
                ),
                onTap: () {
                  Get.offAndToNamed("/homescreen");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
