import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
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
      Uri.parse('http://localhost/products/read.php'),
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
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return loaded
            ? Row(
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
                      Text(myProducts[index].price),
                    ],
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
