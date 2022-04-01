import 'package:boutique/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/dashboard_controller.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: controller.receiptItemsList.length + 1,
          itemBuilder: (context, index) {
            dynamic itemObject;
            if (index < controller.receiptItemsList.length) {
              itemObject = controller.receiptItemsList[index];
            }
            if (index == 0) {
              return Card(
                color: Colors.blueAccent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 49,
                        child: Text('Qnt', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Expanded(child: Text('Item', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                      Text('Price (NGN)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              );
            } else if (index < controller.receiptItemsList.length) {
              return Card(
                color: const Color(0xFFD5E0FC),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Row(
                    children: [
                      SizedBox(width: 49, child: Text(itemObject['quantity'])),
                      Expanded(child: Text(itemObject['name'])),
                      const SizedBox(width: 36),
                      Text(Utils.numberFormat.format(itemObject['price'])),
                      const SizedBox(width: 36),
                      InkWell(
                        onTap: () {
                          controller.receiptItemsList.remove(itemObject);
                          controller.receiptItemsList.refresh();
                          dnd(index);
                          dnd(controller.receiptItemsList);
                        },
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, size: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  const Divider(thickness: 2, color: Color(0xFFD5E0FC)),
                  Card(
                    color: const Color(0x00D5E0FC),
                    elevation: 0,
                    child: Row(
                      children: [
                        const Expanded(child: Text('', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white))),
                        const Text('Total :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                        const SizedBox(width: 36),
                        Obx(() {
                          return Text('NGN ${Utils.numberFormat.format(controller.totalReceiptPrice.value)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white));
                        }),
                      ],
                    ),
                  ),
                ],
              );
            }
          });
    });
  }
}
