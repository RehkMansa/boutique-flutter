import 'package:boutique/controllers/product_controller.dart';
import 'package:boutique/utils/utils.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/products.dart';
import 'package:boutique/view/screens/records.dart';
import 'package:boutique/view/widgets/dialogs.dart';
import 'package:boutique/view/widgets/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../widgets/form_button.dart';
import '../widgets/form_inputs.dart';
import 'my_widgets/screen_search.dart';
import 'my_widgets/screen_title.dart';
import 'my_widgets/side_bar.dart';

class ProductHistory extends GetView<ProductController> {
  ProductHistory({Key? key}) : super(key: key);
  @override
  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    controller.fetchProductHistory(Records.dbProductId.value);
    dnd(controller.itemList);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Row(
            children: [
              SideBar(),
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScreenTitle(
                        title: '${controller.selectedProduct['name']}',
                        text: 'Go Back',
                        icon: Icons.arrow_back,
                        buttonAction: () {
                          Get.offAll(Records());
                        },
                        showButton: true,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                child: Obx(() {
                                  return DataTable(
                                    columns: <DataColumn>[
                                      tableColumn('SN'),
                                      tableColumn('Date'),
                                      tableColumn('Quantity Added'),
                                    ],
                                    rows: tableList(),
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 54,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  tableList() {
    int sn = 1;
    return controller.itemList.map((element) {
      Product cat = Product.fromJson(element);
      return tableData(
        (sn++).toString(),
        cat.createdAt.toString(),
        cat.quantity.toString(),
      );
    }).toList();
  }

  DataColumn tableColumn(String text, {bool center = false}) {
    return DataColumn(
        label: Expanded(
      child: Text(
        text.toUpperCase(),
        textAlign: center ? TextAlign.center : TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.w800, letterSpacing: 2, fontSize: 14),
      ),
    ));
  }

  DataRow tableData(String sn, String createdAt, String quantity) {
    return DataRow(
      color: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 255, 255, 255)),
      cells: <DataCell>[
        DataCell(
          Text(sn,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(createdAt,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(quantity,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
