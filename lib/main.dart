
import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/view/screens/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  Get.put(DashboardController());

  runApp(
    const GetMaterialApp(
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
