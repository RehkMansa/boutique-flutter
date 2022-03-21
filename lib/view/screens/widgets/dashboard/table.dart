import 'package:boutique/view/screens/widgets/dashboard/table/table_row_item.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Table(
      border: const TableBorder(
          horizontalInside: BorderSide(
              width: 1, color: Colors.white, style: BorderStyle.solid)),
      children: [
        const TableRow(children: [
          TableRowItem(text: 'Item', fontWeight: FontWeight.bold),
          TableRowItem(text: 'Price', fontWeight: FontWeight.bold),
          TableRowItem(text: 'Quantity', fontWeight: FontWeight.bold),
          TableRowItem(
            text: 'Remove',
            fontWeight: FontWeight.bold,
          ),
        ]),
        TableRow(children: [
          const TableRowItem(text: 'Rice'),
          const TableRowItem(text: '1200'),
          const TableRowItem(text: '2000'),
          TableRowInkWell(
            onTap: () {
              print('object');
            },
            child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: SizedBox(
                    height: 0,
                    width: 0,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ))),
          )
        ]),
      ],
    ));
  }
}
