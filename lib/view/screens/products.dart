import 'package:boutique/controllers/product_controller.dart';
import 'package:boutique/utils/utils.dart';
import 'package:boutique/view/screens/create_product.dart';
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

class Products extends GetView<ProductController> {
  Products({Key? key}) : super(key: key);
  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController(text: '');
    var categoryInputController = TextEditingController(text: '');
    controller.fetch();

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
                        title: 'Items in stock',
                        buttonAction: () {
                          DashboardSideBar.activePage.value = 'createProduct';
                          Get.to(CreateProduct());
                        },
                        showButton: true,
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
                                      tableColumn('Name of item'),
                                      tableColumn('Item id'),
                                      tableColumn('Price'),
                                      tableColumn('Quantity'),
                                      tableColumn('Add Quantity', center: true),
                                      tableColumn('Change Price', center: true),
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
          Positioned(child: Obx(() {
            return Visibility(
              visible: controller.showCardPrice.value,
              child: Center(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 32),
                    width: 420,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'UPDATE PRICE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () => controller.closeCard(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        FormInput(
                          controller: categoryInputController,
                          hint: 'Enter Price',
                          label: 'Price',
                          inputType: TextInputType.text,
                        ),
                        FormButton(
                            primaryColor: Colors.black87,
                            onPressed: () {
                              controller.updateProduct(
                                  productId: controller.globalProductId.value,
                                  price: categoryInputController.text,
                                  redirectRoute: Products());
                            })
                      ],
                    )),
              ),
            );
          })),
          Positioned(child: Obx(() {
            return Visibility(
              visible: controller.showCardQty.value,
              child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    width: 420,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'ADD QUANTITY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () => controller.closeCard(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        FormInput(
                          controller: categoryInputController,
                          hint: 'Enter Quantity',
                          label: 'Quantity',
                          inputType: TextInputType.text,
                        ),
                        FormButton(
                            primaryColor: Colors.black87,
                            onPressed: () {
                              controller.updateProduct(
                                  productId: controller.globalProductId.value,
                                  quantity: categoryInputController.text,
                                  redirectRoute: Products());
                            })
                      ],
                    )),
              ),
            );
          })),
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
          cat.price.toString(),
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
                controller.showCardQty.value = true;
                controller.showCardPrice.value = false;
                controller.globalProductId.value = productId;
              }),
              label: const Text('Quantity'),
              icon: const Icon(
                Icons.edit,
                size: 14,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: ElevatedButton.icon(
              onPressed: (() {
                controller.showCardQty.value = false;
                controller.showCardPrice.value = true;
                controller.globalProductId.value = productId;
              }),
              label: const Text('Price'),
              icon: const Icon(
                Icons.edit,
                size: 14,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
