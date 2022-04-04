import 'package:boutique/controllers/brand_controller.dart';
import 'package:boutique/models/brand.dart';
import 'package:boutique/view/widgets/form_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/form_inputs.dart';
import 'my_widgets/screen_search.dart';
import 'my_widgets/screen_title.dart';
import 'my_widgets/side_bar.dart';

class Brands extends GetView<BrandController> {
  Brands({Key? key}) : super(key: key);
  var controller = Get.find<BrandController>();

  @override
  Widget build(BuildContext context) {
    var brandInputController = TextEditingController(text: '');
    controller.fetch();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            child: Row(
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
                          title: 'Brands',
                          buttonAction: () => controller.toggleCard(),
                          showButton: true,
                        ),
                        ScreenSearch(
                          searchFunction: (value) => controller.search(value),
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            width: Get.width,
                            child: Obx(() {
                              return DataTable(
                                columns: <DataColumn>[
                                  tableColumn('SN'),
                                  tableColumn('Brand'),
                                  tableColumn('Action', center: true),
                                ],
                                rows: tableList(),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(child: Obx(() {
            return Visibility(
              visible: controller.showCard.value,
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
                              'ADD CATEGORY',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () => controller.toggleCard(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        FormInput(
                          controller: brandInputController,
                          hint: 'Enter Category',
                          label: 'Category',
                          inputType: TextInputType.text,
                        ),
                        FormButton(onPressed: () {
                          controller.add(brandInputController.text);
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
      Brand cat = Brand.fromJson(element);
      return tableData((sn++).toString(), cat.brand.toString(), cat.id.toString());
    }).toList();
  }

  DataColumn tableColumn(String text, {bool center = false}) {
    return DataColumn(
        label: Expanded(
      child: Text(
        text.toUpperCase(),
        textAlign: center ? TextAlign.center : TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2, fontSize: 18),
      ),
    ));
  }

  DataRow tableData(String text1, String text2, String id) {
    return DataRow(
      color: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 255, 255, 255)),
      cells: <DataCell>[
        DataCell(
          Text(
            text1,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        DataCell(
          Text(
            text2,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        DataCell(
          Center(
            child: ElevatedButton.icon(
              onPressed: () => controller.delete(id),
              label: const Text('Remove'),
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
