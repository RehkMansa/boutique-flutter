import 'package:boutique/controllers/brand_controller.dart';
import 'package:boutique/controllers/category_controller.dart';
import 'package:boutique/controllers/product_controller.dart';
import 'package:boutique/view/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

import 'controllers/dashboard_controller.dart';
import 'controllers/subcategory_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ensure printer profile is loaded
  await CapabilityProfile.ensureProfileLoaded();

  Get.put(DashboardController());
  Get.put(CategoryController());
  Get.put(SubcategoryController());
  Get.put(BrandController());
  Get.put(ProductController());

  runApp(
    GetMaterialApp(
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
