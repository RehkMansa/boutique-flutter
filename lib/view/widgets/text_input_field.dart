import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final Color? color;
  final double? labelWidth;
  final double? inputWidth;
  final double? containerHeight;
  final EdgeInsets? padding;
  final Border? border;

  const TextInputField(
      {Key? key,
      required this.label,
      this.labelWidth,
      this.inputWidth,
      this.containerHeight,
      this.padding,
      this.color,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Container(
            height: containerHeight,
            padding: (padding != null) ? padding : const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            padding: (padding != null) ? padding : const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: border,
              color: (color != null) ? color : Colors.white70,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30),
                  border: InputBorder.none),
            ),
          ),
        )
      ]),
    );
  }
}
