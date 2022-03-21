import 'package:boutique/view/screens/dashboard.dart';
import 'package:boutique/view/screens/table_screen/inventory_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/dashboard_controller.dart';

void main() {
  Get.put(DashboardController());

  runApp(
    GetMaterialApp(
      home: InventoryTable(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
