import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.offAllNamed("/homescreen");
            },
          ),
        ],
      ),

      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text("Cart is empty 🛒"));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  var product = cartController.cartItems[index];

                  return ListTile(
                    leading: Image.network(
                      "http://192.168.0.101/products/productimages/" +
                          product.image,
                      width: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.broken_image);
                      },
                    ),

                    title: Text(product.productname),
                    subtitle: Text(product.supplier),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("KSh ${product.price}"),

                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cartController.removeFromCart(product);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Total: KSh ${cartController.totalPrice}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(onPressed: () {}, child: Text("Checkout")),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
