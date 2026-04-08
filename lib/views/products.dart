import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/views/cart.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;

var myProducts = [];
bool loaded = false;
// Product(productname: " cinco", supplier: "Sony", image: ''),
// Product(productname: "omni", supplier: "marv", image: ''),

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  fetchProduct() async {
    final response = await http.get(
      Uri.parse('http://10.7.1.150/products/read.php'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var productData = serverData["data"];

      for (var product in productData) {
        myProducts.add(
          Product(
            productname: product["productname"],
            supplier: product["supplier"],
            image: product["image"],
            price: product["price"],
          ),
        );
      }
      setState(() {
        loaded = true;
      });
    } else {
      throw Exception("Failed to load products");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 59, 246, 46),
        ),
      );
    }
    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

          child: ListTile(
            onTap: () {
              Get.toNamed("/cartscreen", arguments: Product);
            },
            contentPadding: EdgeInsets.all(10),

            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "http://10.7.1.150/products/productimages/" +
                    myProducts[index].image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 40);
                },
              ),
            ),

            title: Text(
              myProducts[index].productname,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            subtitle: Text(
              myProducts[index].supplier,
              style: TextStyle(fontSize: 14),
            ),

            trailing: Text(
              "KSh " + myProducts[index].price,
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
