import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends StatelessWidget {
  final String defaultValue;
  final Colors? color;
  final double? width;
  const DropDown({Key? key, required this.defaultValue, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width != null) ? width : 400,
      //color: Colors.white70,
      // padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            // alignedDropdown: true,
            child: DropdownButton(
              isExpanded: true,
              value: defaultValue,
              items: dropdownItems,
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text(defaultValue), value: defaultValue),
      const DropdownMenuItem(child: Text("Shoe"), value: "Shoe"),
      const DropdownMenuItem(child: Text("Dress"), value: "Dress"),
      const DropdownMenuItem(child: Text("Drinks"), value: "Drinks"),
      const DropdownMenuItem(child: Text("Cookies"), value: "Cookies"),
    ];
    return menuItems;
  }
}
