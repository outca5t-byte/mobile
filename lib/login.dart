import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      "Create an account",

                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text("Name"),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.white,
                  ),
                ),

                SizedBox(height: 30),
                TextField(),
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
                TextField(
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
                  onPressed: () {},
                  color: Colors.amber,
                  child: Text("Register"),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
