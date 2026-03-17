import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              Image.asset('assets/image.png'),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "This is your cart",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  GridView.builder(
                    itemCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 50),

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
