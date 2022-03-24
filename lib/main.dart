import 'package:boutique/view/screens/category+brand.dart';
import 'package:boutique/view/screens/dashboard.dart';
import 'package:boutique/view/screens/inventory.dart';
import 'package:boutique/view/screens/login.dart';
import 'package:boutique/view/screens/product_page.dart';
import 'package:boutique/view/screens/widgets/dashboard/add_category.dart';
import 'package:boutique/view/screens/widgets/dashboard/add_sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/dashboard_controller.dart';
import 'view/screens/widgets/dashboard/add_brand.dart';

void main() {
  Get.put(DashboardController());

  runApp(
    const GetMaterialApp(
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
