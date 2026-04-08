import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

TextEditingController fname = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController sname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController passwordConfirm = TextEditingController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 180, 228),
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
                    "Create an account",

                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text("FirstName"),
              SizedBox(height: 20),
              TextFormField(
                controller: fname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Your first Name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                ],
              ),

              SizedBox(height: 30),

              Text("  phone"),
              SizedBox(height: 20),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Your phone number",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
              ),

              SizedBox(height: 30),

              Text("SurName"),
              SizedBox(height: 20),
              TextFormField(
                controller: sname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Your sir name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                ],
              ),

              SizedBox(height: 30),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",

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
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "name@email.com",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.white,
                ),
              ),

              Text(
                "Password",

                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),

              TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),

              Text(
                "Confirm password",

                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordConfirm,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: " Confirm Password",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  print("testbuttonclick");

                  try {
                    if (fname.text.isEmpty) {
                      Get.snackbar("Error", "Please enter your first name");
                    } else if (phone.text.isEmpty) {
                      Get.snackbar("Error", "Please enter your phone number");
                    } else if (sname.text.isEmpty) {
                      Get.snackbar("Error", "Please enter your sir name");
                    } else if (email.text.isEmpty) {
                      Get.snackbar("Error", "Please enter your email address");
                    } else if (password.text.isEmpty ||
                        passwordConfirm.text.isEmpty ||
                        password.text.toString().compareTo(
                              passwordConfirm.text.toString(),
                            ) !=
                            0) {
                      Get.snackbar(
                        "Error",
                        "Password and Confirm password do not match",
                      );
                    } else {
                      final response = await http.get(
                        Uri.parse(
                          "http://localhost/users/create.php?fname=${fname.text}&sname=${sname.text}&email=${email.text}&phone=${phone.text}&password=${password.text}",
                        ),
                      );
                      print("STATUS: ${response.statusCode}");
                      print("BODY: ${response.body}");
                      print(response.body);

                      if (response.statusCode == 200) {
                        final serverData = jsonDecode(response.body);
                        print(serverData);
                        if (serverData["success"].toString() == "1") {
                          Get.snackbar("Success", "Registration successful");
                          Get.offAndToNamed("/");
                        }
                      } else {
                        Get.snackbar("Register", "Registration failed");
                      }
                    }
                  } catch (c) {
                    print("Error " + c.toString());
                  }
                },
                color: buttonColor,

                child: Text("Register"),
              ),
              SizedBox(height: 20),
              GestureDetector(
                child: Text("Sign in", style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Get.toNamed("/");
                },
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
