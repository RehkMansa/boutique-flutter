import 'package:boutique/view/widgets/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';
import '../../models/category.dart';
import '../widgets/form_inputs.dart';
import 'my_widgets/screen_search.dart';
import 'my_widgets/screen_title.dart';
import 'my_widgets/side_bar.dart';

class Categories extends GetView<CategoryController> {
  Categories({Key? key}) : super(key: key);
  var categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController(text: '');
    var categoryInputController = TextEditingController(text: '');
    categoryController.fetch();

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
                          title: 'Categories',
                          buttonAction: () => categoryController.toggleCard(),
                          showButton: true,
                        ),
                        ScreenSearch(
                          searchFunction: (value) => categoryController.search(value),
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            width: Get.width,
                            child: Obx(() {
                              return DataTable(
                                columns: <DataColumn>[
                                  tableColumn('SN'),
                                  tableColumn('Category'),
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
              visible: categoryController.showCard.value,
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
                              onPressed: () => categoryController.toggleCard(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        FormInput(
                          controller: categoryInputController,
                          hint: 'Enter Category',
                          label: 'Category',
                          inputType: TextInputType.text,
                        ),
                        FormButton(onPressed: () {
                          categoryController.add(categoryInputController.text);
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
    return categoryController.itemList.map((element) {
      Category cat = Category.fromJson(element);
      return tableData((sn++).toString(), cat.category.toString(), cat.id.toString());
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
              onPressed: () => categoryController.delete(id),
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
