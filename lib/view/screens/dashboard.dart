import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/models/product.dart';
import 'package:boutique/view/screens/printer/demo.dart';
import 'package:boutique/view/screens/printer/service.dart';
import 'package:boutique/view/screens/printer/webview_helper.dart';
import 'package:boutique/view/screens/widgets/dashboard/input_section.dart';
import 'package:boutique/view/screens/widgets/dashboard/wide_button.dart';
import 'package:boutique/view/widgets/numpad.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:boutique/view/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_printer_manager/models/usb_printer.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager/services/usb_printer_manager.dart';
import 'package:webcontent_converter/webcontent_converter.dart';

import '../../res/strings.dart';
import '../widgets/dialogs.dart';
import 'widgets/dashboard/floating_icon.dart';
import 'widgets/dashboard/table.dart';

class Dashboard extends GetView<DashboardController> {
  var _manager;

  var _printer;

  var showLoading = false.obs;

  Dashboard({Key? key}) : super(key: key);

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
                                          WideButton(
                                              text: 'Payment Mode',
                                              background: Colors.black87,
                                              onPressed: () {
                                                controller.makePayment();
                                              }),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                              text: 'Print Preview',
                                              background: Colors.black87,
                                              onPressed: () {
                                                if (controller.paymentMade.value == false) {
                                                  errorDialog('Please select mode of payment before printing receipt', title: 'Alert!!');
                                                } else {
                                                  _scan();
                                                }
                                              }),
                                          const SizedBox(height: 12.0),
                                          WideButton(
                                            text: 'Cancel Print',
                                            background: Colors.black87,
                                            onPressed: () => controller.showPrintPreview.value = false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20, left: 20),
                                      child: Column(
                                        children: [
                                          Obx(
                                            () => FloatingIcon(
                                                icon: const Icon(Icons.money),
                                                onPressed: () {
                                                  controller.selectPaymentMethod('cash');
                                                },
                                                controller: controller,
                                                selected: controller.selectedCash.value),
                                          ),
                                          Obx(
                                            () => FloatingIcon(
                                                icon: const Icon(Icons.credit_card),
                                                onPressed: () {
                                                  controller.selectPaymentMethod('card');
                                                },
                                                controller: controller,
                                                selected: controller.selectedCard.value),
                                          ),
                                          Obx(
                                            () => FloatingIcon(
                                                icon: const Icon(Icons.account_balance),
                                                onPressed: () {
                                                  controller.selectPaymentMethod('transfer');
                                                },
                                                controller: controller,
                                                selected: controller.selectedTransfer.value),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 2,
                                            margin: const EdgeInsets.symmetric(vertical: 8),
                                            color: Colors.black45,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: const Color(0xaaff0000),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: IconButton(
                                                color: Colors.white,
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  controller.clearPurchase();
                                                },
                                              ),
                                            ),
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
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bga.png'), fit: BoxFit.cover)),
                  height: double.infinity,
                  child: Container(
                    color: const Color(0xDE091222),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          padding: const EdgeInsets.only(top: 16, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(backgroundImage: AssetImage(Str.brandImage), radius: 20),
                                  SizedBox(width: 8),
                                  Text('Boutique', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text('List of purchase items and their prices', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70)),
                            ],
                          ),
                        ),
                        Container(
                          height: _screenHeight - 130,
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: const TableWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Obx(
                    () => Visibility(
                      visible: controller.showPrintPreview.value,
                      child: Container(
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bga.png'), fit: BoxFit.cover)),
                        height: double.infinity,
                        child: Container(
                          color: const Color(0xFFffffff),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  // height: _screenHeight,
                                  width: double.infinity,
                                  color: const Color(0xFFffffff),
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.only(left: 100),
                                  child: !controller.data.value.isEmpty
                                      ? Image.memory(
                                          controller.bytes.value,
                                          width: double.infinity,
                                          height: double.infinity,
                                          // centerSlice: new Rect.fromLTRB(6.0, 0.0, 16.0, 51.0)
                                        )
                                      : Image.asset('assets/images/receipt.png'),
                                ),
                              ),
                              Center(
                                  child: WideButton(
                                background: Colors.blueAccent,
                                text: 'Print Now',
                                onPressed: () {
                                  if (_manager != null) {
                                    print("isConnected ${_manager!.isConnected}");
                                    _manager!.writeBytes(controller.data.value, isDisconnect: false);
                                  }
                                  controller.showPrintPreview.value = false;
                                  controller.receiptItemsList.value.clear();
                                  controller.searchResultList.value.clear();
                                  controller.receiptItemsList.add('item');
                                },
                              )),
                              const SizedBox(height: 4)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Obx(
                    () => Visibility(
                      visible: showLoading.value,
                      child: Container(
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bga.png'), fit: BoxFit.cover)),
                        child: Container(
                          height: double.infinity,
                          color: const Color(0xAA000000),
                          child: const Center(
                            child: Text(
                              'Loading print preview...',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _scan() async {
    showLoading.value = true;
    var printers = await USBPrinterManager.discover();
    printers.forEach((printer) {
      if (printer.name == 'XP-58') {
        _printer = printer;
        _connect(printer);
        _startPrinter();
      }
    });
  }

  _connect(USBPrinter printer) async {
    var paperSize = PaperSize.mm58;
    var profile = await CapabilityProfile.load();
    var manager = USBPrinterManager(printer, paperSize, profile);
    await manager.connect();

    _manager = manager;
    _printer.connected = true;
  }

  _startPrinter() async {
    // if (controller.data.value.isEmpty) {
    final content = Demo.getPrintOut2(controller.receiptItemsList);
    var bytes = await WebcontentConverter.contentToImage(
      content: content,
      executablePath: WebViewHelper.executablePath(),
    );
    var service = ESCPrinterService(bytes);
    var data = await service.getBytes();
    controller.data.value = data;
    controller.bytes.value = bytes;
    controller.showPrintPreview.value = true;
    showLoading.value = false;
    // }
    //
    // if (_manager != null) {
    //   print("isConnected ${_manager!.isConnected}");
    //   // _manager!.writeBytes(controller.data.value, isDisconnect: false);
    // }
  }
}
