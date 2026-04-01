import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;

var myProducts = [];
// Product(productname: " cinco", supplier: "Sony", image: ''),
// Product(productname: "omni", supplier: "marv", image: ''),

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  fetchProduct() async {
    var response = await http.get(
      Uri.parse('http://localhost/products/read.php'),
    );
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var productData = serverData["data"];
      for (var product in productData) {
        myProducts.add(
          product(
            name: product["productname"],
            supplier: product["supplier"],
            image: product["image"],
          ),
        );
      }
    } else {
      Get.snackbar("Error", " Server error");
    }
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Image.network(
              "http://localhost/products/productimages/" +
                  myProducts[index].image,
              width: 40,
              height: 50,
            ),
            Column(
              children: [
                Text(myProducts[index].productname),
                Text(myProducts[index].supplier),
                Text(myProducts[index].image),
              ],
            ),
          ],
        );
      },
    );
    ;
  }
}
