import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryTable extends StatelessWidget {
  const InventoryTable({Key? key}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'ITEM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'QUANTITY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'DESCRIPTION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'DATE PURCHASED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Center(
                        child: Text(
                      '1',
                      textAlign: TextAlign.center,
                    ))),
                    DataCell(
                      Center(
                        child: Text(
                      '2',
                      textAlign: TextAlign.center,
                    ))),
                    DataCell(Center(child: Text('3', textAlign: TextAlign.center,))),
                    DataCell(Text('4')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('1')),
                    DataCell(Text('2')),
                    DataCell(Text('3')),
                    DataCell(Text('4')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('1')),
                    DataCell(Text('2')),
                    DataCell(Text('3')),
                    DataCell(Text('4')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('1')),
                    DataCell(Text('2')),
                    DataCell(Text('3')),
                    DataCell(Text('4')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
