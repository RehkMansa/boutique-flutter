import 'package:boutique/controllers/product_controller.dart';
import 'package:boutique/utils/utils.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/price_history.dart';
import 'package:boutique/view/screens/product_history.dart';
import 'package:boutique/view/screens/products.dart';
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

class Records extends GetView<ProductController> {
  static final dbProductId = ''.obs;
  Records({Key? key}) : super(key: key);
  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController(text: '');
    var categoryInputController = TextEditingController(text: '');
    controller.fetch();

    controller.dateFilter();

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
                        title: 'Records',
                      ),
                      ScreenSearch(
                        searchFunction: (value) => controller.search(value),
                      ),
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
                                      tableColumn('Product'),
                                      tableColumn('Item id'),
                                      tableColumn('Price'),
                                      tableColumn('Quantity in Stock'),
                                      tableColumn('Product History'),
                                      tableColumn('Price History'),
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
          cat.name.toString(),
          cat.productId.toString(),
          //utils throws an error
          Utils.numberFormat.format(int.parse(cat.price.toString())),
          cat.quantity.toString(),
          cat.id.toString());
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

  DataRow tableData(String sn, String name, String productId, String price,
      String quantity, String id) {
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
          Text(name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(productId,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(price,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(quantity,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Center(
            child: ElevatedButton.icon(
              onPressed: (() {
                dbProductId.value = productId;
                controller.selectedProductIndex = int.parse(sn) - 1;
                SideBar.subMenuPage = 'product history';
                Get.offAll(ProductHistory());
              }),
              label: const Text('Product History'),
              icon: const Icon(
                Icons.visibility,
                size: 14,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: ElevatedButton.icon(
              onPressed: (() {
                dbProductId.value = productId;
                controller.selectedProductIndex = int.parse(sn) - 1;
                SideBar.subMenuPage = 'price history';
                Get.offAll(PriceHistory());
              }),
              label: const Text('Price History'),
              icon: const Icon(
                Icons.visibility,
                size: 14,
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0A1E39),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
