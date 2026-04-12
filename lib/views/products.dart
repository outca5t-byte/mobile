import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> myProducts = [];
  bool loaded = false;

  final CartController cartController = Get.find();

  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  fetchProduct() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.8.51/products/read.php'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var serverData = jsonDecode(response.body);
        var productData = serverData["data"];

        myProducts.clear();

        for (var product in productData) {
          myProducts.add(
            Product(
              productname: product["productname"],
              supplier: product["supplier"],
              image: product["image"],
              price: product["price"].toString(),
            ),
          );
        }

        setState(() {
          loaded = true;
        });
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
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.offAllNamed("/homescreen");
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed("/cartscreen");
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: myProducts.length,
        itemBuilder: (context, index) {
          var product = myProducts[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

            child: ListTile(
              contentPadding: EdgeInsets.all(10),

              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "http://192.168.8.51/products/productimages/" + product.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image);
                  },
                ),
              ),

              title: Text(
                product.productname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(product.supplier),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "KSh ${product.price}",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cartController.addToCart(product);

                      Get.snackbar(
                        "Added",
                        "${product.productname} added to cart",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
