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
                color: const Color(0xFFD5E0FC),
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
                      SizedBox(width: 36),
                      Text('Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(width: 36),
                      Text('Del', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              );
            } else if (index < controller.receiptItemsList.length) {
              return Card(
                color: const Color(0xFFD5E0FC),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(width: 49, child: Text(itemObject['quantity'])),
                      Expanded(child: Text(itemObject['name'])),
                      const SizedBox(width: 36),
                      Text(itemObject['price']),
                      const SizedBox(width: 36),
                      InkWell(
                        onTap: () {
                          controller.receiptItemsList.remove(itemObject);
                          controller.receiptItemsList.refresh();
                          dnd(index);
                          dnd(controller.receiptItemsList);
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, size: 14, color: Colors.white),
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
                    color: const Color(0xFFD5E0FC),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                      child: Row(
                        children: const [
                          Expanded(child: Text('', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                          SizedBox(width: 36),
                          Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(width: 36),
                          Text('NGN 12,488', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          });
    });
  }
}
