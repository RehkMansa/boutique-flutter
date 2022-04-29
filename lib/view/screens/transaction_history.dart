import 'package:boutique/controllers/product_controller.dart';
import 'package:boutique/models/order.dart';
import 'package:boutique/utils/utils.dart';
import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/product_order_history.dart';
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

class TransactionHistory extends GetView<ProductController> {
  TransactionHistory({Key? key}) : super(key: key);
  @override
  var toggleView = true.obs;
  static final dbOrderId = ''.obs;
  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    controller.fetchAllTransactionHistory();

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
                      const ScreenTitle(title: "Transaction History"),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          rangeButton(
                            text: 'View Single Date',
                            onPressed: controller.singleDateView,
                          ),
                          rangeButton(
                            text: 'View for the week',
                            onPressed: controller.weekView,
                          ),
                          rangeButton(
                              text: 'View for date range',
                              onPressed: controller.dateRangeView)
                        ],
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
                                      tableColumn('Time'),
                                      tableColumn('Amount'),
                                      tableColumn('Payment Method'),
                                      tableColumn('View Order History'),
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
      Order cat = Order.fromJson(element);
      return tableData(
        (sn++).toString(),
        cat.createdAt.toString(),
        cat.updatedAt.toString(),
        Utils.numberFormat.format(int.parse(cat.amount.toString())),
        cat.paymentMethod.toString(),
        cat.id.toString(),
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

  DataRow tableData(String sn, String createdAt, String updatedAt,
      String amount, String paymentMethod, String orderId) {
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
          Text(updatedAt,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(amount,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Text(paymentMethod,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center),
        ),
        DataCell(
          Center(
            child: ElevatedButton.icon(
              onPressed: (() {
                dbOrderId.value = orderId;
                controller.selectedProductIndex = int.parse(sn) - 1;
                Get.offAll(OrderHistory());
              }),
              label: const Text('View Order History'),
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
      ],
    );
  }

  Widget rangeButton({
    required String text,
    required Function() onPressed,
    Color? primaryColor,
  }) {
    primaryColor = Colors.black;
    return Container(
      margin: const EdgeInsets.only(right: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text.capitalize.toString()),
        style: TextButton.styleFrom(
          primary: primaryColor,
          fixedSize: const Size(double.infinity, 40),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
