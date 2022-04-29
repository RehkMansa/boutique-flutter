import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/controllers/inventory_controller.dart';
import 'package:boutique/view/screens/table_screen/inventory_table.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:boutique/view/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'my_widgets/side_bar.dart';

class InventoryScreen extends GetView<InventoryController> {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashController = Get.find<DashboardController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: double.infinity,
          child: Row(
            children: [
              SideBar(),
              Expanded(
                flex: 9,
                child: Container(
                  width: Get.width,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20), bottom: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Color(0xFF021E49),
                        ))),
                        width: Get.width,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text(
                                  'Reports',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    fontSize: 38,
                                  ),
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
                                borderColor:
                                    const Color.fromARGB(255, 199, 202, 206),
                                containerMargin: EdgeInsets.all(15),
                                triggerSearch: (String? val) {},
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
            ],
          ),
        ),
      ),
    );
  }
}
