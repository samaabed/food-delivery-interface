import 'package:flutter/material.dart';
import 'package:food_delivery/pages/custom_bottom_navbar.dart';
import 'package:food_delivery/pages/product_details_page.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      title: 'Food Delivery',
      theme: AppTheme.appTheme(theme),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const CustomBottomNavBar(), 
        '/product-details':(context) => ProductDetailsPage(foodItem: products[0]),
      },
    );
  }
}

