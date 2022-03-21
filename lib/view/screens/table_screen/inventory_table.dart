import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/controllers/inventory_controller.dart';
import 'package:boutique/view/screens/table_screen/table_cell.dart';
import 'package:boutique/view/screens/table_screen/text_label.dart';
import 'package:boutique/view/widgets/search_input.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryTable extends GetView<InventoryController> {
  var dashController = Get.find<DashboardController>();
  InventoryTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: Get.width,
          height: double.infinity,
          margin: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), bottom: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: SearchInput(
                  controller: dashController,
                  width: Get.width,
                  backgroundColor: Color.fromARGB(255, 239, 242, 245),
                  borderColor: Color.fromARGB(255, 199, 202, 206),
                ),
              ),
              Container(
                width: Get.width,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Center(
                            child: TextLabel(
                          textLabel: 'ITEM',
                        )),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Center(
                            child: TextLabel(
                          textLabel: 'Quantity',
                        )),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Center(
                            child: TextLabel(
                          textLabel: 'Description',
                        )),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Center(
                            child: TextLabel(
                          textLabel: 'Date Added',
                        )),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      color: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 239, 242, 245)),
                      cells: const <DataCell>[
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                      ],
                    ),
                    const DataRow(
                      cells: <DataCell>[
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                      ],
                    ),
                    DataRow(
                      color: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 239, 242, 245)),
                      cells: const <DataCell>[
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                        DataCell(TableCellText(
                          cellText: 'A text',
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
