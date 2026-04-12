import 'package:flutter_application_1/views/cart.dart';
import 'package:flutter_application_1/views/homescreen.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/products.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_application_1/views/products.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignUp()),
  GetPage(name: "/homescreen", page: () => HomeScreen()),
  GetPage(name: "/profilescreen", page: () => ProfileScreen()),
  GetPage(name: "/cartscreen", page: () => CartScreen()),
  GetPage(name: "/productscreen", page: () => ProductScreen()),
];
