import 'package:flutter/material.dart';

class ItemFields extends StatelessWidget {
  final String label;
  final String text;

  const ItemFields({Key? key, this.label = '', this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          width: 80,
          padding: const EdgeInsets.all(17),
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
        Container(
          width: 300,
          padding: const EdgeInsets.all(17),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        )
      ]),
    );
  }
}
