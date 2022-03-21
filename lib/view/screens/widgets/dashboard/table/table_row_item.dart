import 'package:flutter/material.dart';

class TableRowItem extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;

  const TableRowItem({Key? key, required this.text, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: fontWeight, color: Colors.white),
      ),
    );
  }
}
