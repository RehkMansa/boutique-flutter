import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/controllers/inventory_controller.dart';
import 'package:boutique/view/screens/table_screen/inventory_table.dart';
import 'package:boutique/view/screens/table_screen/table_cell.dart';
import 'package:boutique/view/screens/table_screen/text_label.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryScreen extends GetView<InventoryController> {
  var dashController = Get.find<DashboardController>();
  InventoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: Get.width,
          height: double.infinity,
          margin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), bottom: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF091F46),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                width: Get.width,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'INVENTORY',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: Get.width,
                        )),
                    Expanded(
                      flex: 4,
                      child: SearchInput(
                        controller: dashController,
                        width: Get.width,
                        // backgroundColor:
                        borderColor: const Color.fromARGB(255, 199, 202, 206),
                        containerMargin: EdgeInsets.all(15),
                      ),
                    ),
                  ],
                ),
              ),
              InventoryTable()
            ],
          ),
        ),
      ),
    );
  }
}
