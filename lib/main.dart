import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/image.png'),
            Text(
              "Login screen",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w400,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Enter username",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30),
            TextField(),
            SizedBox(height: 30),
            Text(
              "Enter password",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(),
            SizedBox(height: 50),
            MaterialButton(
              onPressed: () {},
              hoverColor: Colors.blue,
              child: Text(
                "login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              color: Colors.black,
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "Login Screen",
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          centerTitle: true,
        ),
      ),
    ),
  );
}
