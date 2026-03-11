import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 32, 50),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          // allows code to scroll when the screen is too small
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/image.png'),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter username",

                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Use email or phone number",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                ),
              ),

              SizedBox(height: 30),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter password",

                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Type recent password",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 50),
              // MaterialButton(
              //   onPressed: () {},
              //   hoverColor: Colors.blue,
              //   color: Colors.black,
              //   child: Text(
              //     "login",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 23,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              GestureDetector(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(54, 255, 141, 200),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                onTap: () {
                  Get.offAndToNamed("/homescreen");
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              ), // align the text below with the login bar
              Row(
                children: [
                  Text("New User?", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10), // space between the 2 (width)
                  GestureDetector(
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.toNamed("/signup");
                    },
                  ),
                  Spacer(), // space between the 2 (height)
                  Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text("Reset ", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: Text(
      //     "Login Screen",
      //     style: TextStyle(color: Colors.red, fontSize: 24),
      //   ),
      //   centerTitle: true,
      // ),
    );
  }
}
