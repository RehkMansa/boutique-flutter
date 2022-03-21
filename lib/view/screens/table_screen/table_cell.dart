import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableCellText extends StatelessWidget {
  final String cellText;
  final Color? textColor;
  const TableCellText({Key? key, required this.cellText, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      cellText,
      style: TextStyle(
        color: textColor,
      ),
      textAlign: TextAlign.center,
    ));
  }
}
