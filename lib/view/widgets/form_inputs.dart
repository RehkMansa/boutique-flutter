import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType inputType;

  const FormInput(
      {Key? key,
      required this.controller,
      this.label = '',
      this.hint = '',
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(8, 24, 0, 8),
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.blueGrey),
                bottom: BorderSide(width: 1.0, color: Colors.blueGrey),
                left: BorderSide(width: 1.0, color: Colors.blueGrey),
                right: BorderSide(width: 1.0, color: Colors.blueGrey),
              ),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
