import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/models/product.dart';
import 'package:boutique/view/screens/widgets/dashboard/input_section.dart';
import 'package:boutique/view/screens/widgets/dashboard/wide_button.dart';
import 'package:boutique/view/widgets/dialogs.dart';
import 'package:boutique/view/widgets/numpad.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:boutique/view/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/dashboard/floating_icon.dart';
import 'widgets/dashboard/table.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: const SideBar(),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(children: [
                          FittedBox(
                            child: SearchInput(
                              controller: controller,
                              triggerSearch: controller.searchProduct,
                            ),
                          ),
                          const FittedBox(
                            child: InputSection(),
                          ),
                          FittedBox(
                            child: SizedBox(
                              width: 800,
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(right: 30),
                                        width: 430,
                                        child: Obx(() {
                                          return NumPad(
                                              buttonColor: Colors.black87, delete: controller.changeVisibility, onSubmit: () {}, controller: controller.fieldText.value);
                                        })),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          WideButton(
                                              text: 'Enter',
                                              background: Colors.black38,
                                              onPressed: () {
                                                controller.changeVisibility(false);
                                                controller.populateItemFieldsFromEnter('');
                                              }),
                                          const SizedBox(height: 12.0),
                                          WideButton(text: 'Make Payment', background: Colors.black87, onPressed: () => controller.makePayment()),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Print',
                                              background: Colors.black87,
                                              onPressed: () {
                                                if (controller.paymentMade.value == false) {
                                                  errorDialog('Please make payment before printing', title: 'Alert!!');
                                                } else {
                                                  controller.printToggle(value: true);
                                                }
                                              }),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Next',
                                              background: Colors.black87,
                                              onPressed: () {
                                                controller.changeVisibility(false);
                                                controller.populateItemFieldsFromEnter('');
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20, left: 20),
                                      child: Column(
                                        children: [
                                          FloatingIcon(
                                            icon: const Icon(Icons.money),
                                            onPressed: () {},
                                            controller: controller,
                                          ),
                                          FloatingIcon(
                                            icon: const Icon(Icons.credit_card),
                                            onPressed: () {},
                                            controller: controller,
                                          ),
                                          FloatingIcon(
                                            icon: const Icon(Icons.account_balance),
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
                          top: _screenWidth / 18,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Obx(() {
                              return Visibility(
                                visible: controller.checkVisibility.value,
                                child: FittedBox(
                                  child: SingleChildScrollView(
                                    child: Container(
                                        width: 1000,
                                        height: 200,
                                        padding: EdgeInsets.only(left: _screenWidth / 28, right: 600),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(24),
                                          ),
                                        ),
                                        child: ListView.builder(
                                            itemCount: controller.searchResultList.value.length,
                                            itemBuilder: (context, index) {
                                              var itemObject = Product.fromJson(controller.searchResultList.value[index]);
                                              // if (controller.searchResultList.value.length == 1) {
                                              //   controller.populateItemFields(itemObject);
                                              // }
                                              return GestureDetector(
                                                onTap: () => controller.populateItemFields(itemObject),
                                                child: Card(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                                    child: Row(
                                                      children: [
                                                        Text(itemObject.productId!),
                                                        const SizedBox(width: 36),
                                                        Text(itemObject.name!),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })),
                                  ),
                                ),
                              );
                            }),
                          ),
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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bga.png'), fit: BoxFit.cover)),
              height: double.infinity,
              child: Container(
                color: const Color(0xDE091222),
                child: Obx(() {
                  return Visibility(
                    visible: !controller.togglePrint.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 16, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Boutique', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white60)),
                              SizedBox(height: 4),
                              Text('List of purchase items and their prices', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70)),
                            ],
                          ),
                        ),
                        Container(
                          height: _screenHeight - 100,
                          width: double.infinity,
                          // color: const Color(0xFF091222),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: TableWidget(),
                        ),
                      ],
                    ),
                  );
                  // return const ReceiptPrintOut();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
