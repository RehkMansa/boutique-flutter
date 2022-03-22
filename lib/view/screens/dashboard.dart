import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/view/screens/widgets/dashboard/description_filed.dart';
import 'package:boutique/view/screens/widgets/dashboard/input_section.dart';
import 'package:boutique/view/screens/widgets/dashboard/items_fields.dart';
import 'package:boutique/view/screens/widgets/dashboard/print_out.dart';
import 'package:boutique/view/screens/widgets/dashboard/quantity+input.dart';
import 'package:boutique/view/screens/widgets/dashboard/table.dart';
import 'package:boutique/view/screens/widgets/dashboard/wide_button.dart';
import 'package:boutique/view/widgets/dialogs.dart';
import 'package:boutique/view/widgets/numpad.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/dashboard/floating_icon.dart';

class Dashboard extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.blueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Column(children: [
                          FittedBox(
                            child: SearchInput(
                              controller: controller,
                            ),
                          ),
                          FittedBox(
                            child: InputSection(),
                          ),
                          FittedBox(
                            child: Container(
                              width: 800,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        width: 430,
                                        child: Obx(() {
                                          return NumPad(
                                              buttonColor: Colors.black87,
                                              delete:
                                                  controller.changeVisibility,
                                              onSubmit: () {},
                                              controller:
                                                  controller.fieldText.value);
                                        })),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          WideButton(
                                              text: 'Enter',
                                              background: Colors.black38,
                                              onPressed: () {}),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Make Payment',
                                              background: Colors.black87,
                                              onPressed: () =>
                                                  controller.makePayment()),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Print',
                                              background: Colors.black87,
                                              onPressed: () {
                                                if (controller
                                                        .paymentMade.value ==
                                                    false) {
                                                  errorDialog(
                                                      'Please make payment before printing',
                                                      title: 'Alert!!');
                                                } else {
                                                  controller.printToggle(
                                                      value: true);
                                                }
                                              }),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Next',
                                              background: Colors.black87,
                                              onPressed: () {}),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Column(
                                        children: [
                                          FloatingIcon(
                                            icon: Icon(Icons.money),
                                            onPressed: () {},
                                            controller: controller,
                                          ),
                                          FloatingIcon(
                                            icon: Icon(Icons.credit_card),
                                            onPressed: () {},
                                            controller: controller,
                                          ),
                                          FloatingIcon(
                                            icon: Icon(Icons.account_balance),
                                            onPressed: () {},
                                            controller: controller,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Positioned(
                          top: 77,
                          left: -5,
                          child: Obx(() {
                            return Visibility(
                              visible: controller.checkVisibility.value,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: 770,
                                  height: 150,
                                  margin: const EdgeInsets.only(left: 20),
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Obx(() {
                      return Visibility(
                        visible: !controller.togglePrint.value,
                        child: Container(
                          height: 750,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          color: const Color(0xFF091222),
                          child: Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(child: TableWidget()),
                          ),
                        ),
                      );
                    }),
                  ),
                  Obx(() {
                    return Visibility(
                        visible: controller.togglePrint.value,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                            padding: const EdgeInsets.all(10),
                            width: 350,
                            child: PrintOutSlip()));
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
