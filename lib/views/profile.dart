import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/colors.dart' as colors;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  String phone = "";
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    phone = Get.arguments ?? "5678";

    fetchUser();
  }

  fetchUser() async {
    try {
      final response = await http.get(
        Uri.parse("http://http://localhost/users/getuser.php?phone=5678"),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data["success"]) {
          var user = data["data"];

          setState(() {
            nameController.text = user["fname"] ?? "";
            emailController.text = user["email"] ?? "";
            phoneController.text = user["phone"] ?? "";
            loaded = true;
          });
        }
      }
    } catch (e) {
      print("ERROR: $e");
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.secondaryColor,
        title: Image.asset('assets/image.png', height: 70, width: 80),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: CircleAvatar(
                backgroundColor: buttonColor,
                radius: 50,
                child: const Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text("Hi User", style: const TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 30),

            const Text("FName"),
            TextField(
              controller: nameController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text("Email"),
            TextField(
              controller: emailController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text("Phone"),
            TextField(
              controller: phoneController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Get.offAllNamed("/homescreen");
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(242, 244, 190, 13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
