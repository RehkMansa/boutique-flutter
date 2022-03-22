import 'package:boutique/view/screens/table_screen/table_cell.dart';
import 'package:boutique/view/screens/table_screen/text_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var alternate = true.obs;

DataColumn tableColumn(String text) {
  return DataColumn(
      label: Expanded(
    child: Center(
        child: TextLabel(
      textLabel: text,
    )),
  ));
}

DataRow tableData(String text1, String text2, String text3, String text4,
    String text5, String text6, String text7) {
  alternate.value = alternate.value ? false : true;
  return DataRow(
    color: MaterialStateColor.resolveWith((states) => alternate.value
        ? Color.fromARGB(255, 255, 255, 255)
        : Color.fromARGB(255, 249, 0, 250)),
    cells: <DataCell>[
      DataCell(TableCellText(
        cellText: text1,
      )),
      DataCell(TableCellText(
        cellText: text2,
      )),
      DataCell(TableCellText(
        cellText: text3,
      )),
      DataCell(TableCellText(
        cellText: text4,
      )),
      DataCell(TableCellText(
        cellText: text4,
      )),
      DataCell(TableCellText(
        cellText: text4,
      )),
      DataCell(TableCellText(
        cellText: text4,
      )),
    ],
  );
}
