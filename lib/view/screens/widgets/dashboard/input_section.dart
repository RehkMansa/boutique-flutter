import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/view/screens/widgets/dashboard/items_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSection extends StatelessWidget {
  const InputSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dashboardController = Get.find<DashboardController>();
    return Column(
      children: [
        SizedBox(
          width: 800,
          child: Row(
            children: [
              Obx(() => ItemFields(label: 'Name', text: dashboardController.itemName.value.toString())),
              const SizedBox(width: 16.0),
              Obx(() => ItemFields(label: 'ID', text: dashboardController.itemId.value.toString())),
            ],
          ),
        ),
        SizedBox(
          width: 800,
          child: Row(
            children: [
              Obx(() => ItemFields(label: 'Price', text: dashboardController.itemPrice.value.toString())),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.all(17),
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      ),
                      child: const Text('Quantity', style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      width: 290,
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 48),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Obx(
                        () => TextField(
                          controller: dashboardController.quantityInputController.value,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black12,
                                  //radius: 30,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      var currentQuantity = int.parse(dashboardController.quantityInputController.value.text);
                                      dashboardController.quantityInputController.value.text = (++currentQuantity).toString();
                                      dashboardController.itemQuantity.value = currentQuantity;
                                    },
                                  ),
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black12,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                    color: Colors.black87,
                                    onPressed: () {
                                      var currentQuantity = int.parse(dashboardController.quantityInputController.value.text);
                                      if (currentQuantity > 1) {
                                        dashboardController.quantityInputController.value.text = (--currentQuantity).toString();
                                      }
                                      dashboardController.itemQuantity.value = currentQuantity;
                                    },
                                  ),
                                ),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 800,
          margin: EdgeInsets.only(bottom: 24, top: 16),
          child: Row(children: [
            Container(
              width: 150,
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
              ),
              child: const Align(
                child: Text('Description', style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: 625,
              height: 64,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Obx(() => Text(
                    dashboardController.itemDescription.value.toString(),
                    style: TextStyle(color: Colors.black),
                  )),
            )
          ]),
        ),
      ],
    );
  }
}
