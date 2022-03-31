import 'package:flutter/material.dart';

class ProductInput extends StatelessWidget {
  const ProductInput({Key? key, this.hint = '', this.label = '', required this.controller}) : super(key: key);
  final String hint;
  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 4),
          Material(
            elevation: 2,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
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
