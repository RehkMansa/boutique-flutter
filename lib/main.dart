import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

import 'controllers/dashboard_controller.dart';
import 'view/screens/category+brand.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ensure printer profile is loaded
  await CapabilityProfile.ensureProfileLoaded();

  Get.put(DashboardController());

  runApp(
    const GetMaterialApp(
      home: AddCateGoryAndBrand(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
