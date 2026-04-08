import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';

class CartScreen extends StatelessWidget {
  final Product product;

  const CartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "http://10.7.1.150/products/productimages/" + product.image,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 60);
                  },
                ),
                SizedBox(height: 10),
                Text(
                  product.productname,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(product.supplier),
                SizedBox(height: 10),
                Text(
                  "KSh " + product.price,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
