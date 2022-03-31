import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget DropDown({width, color, required List dropdownList, required label, onChanged, value}) {
  var list = [].obs;
  // var def = dropdownList.isEmpty ? '--Select--' : dropdownList[0];
  dynamic def = '--Select--'.obs;
  def = value; //dropdownList[0];
  // list = dropdownList.map((items) {
  //   return DropdownMenuItem(value: items.toString(), child: Text(items.toString()));
  // }).toList();
  list.value = dropdownList;
  List<DropdownMenuItem<Object>> ls = list.map((items) {
    return DropdownMenuItem(value: items.toString(), child: Text(items.toString()));
  }).toList();

  return Container(
    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        Material(
          elevation: 2,
          type: MaterialType.card,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(
              () => DropdownButtonHideUnderline(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  isExpanded: true,
                  value: def.value,
                  items: ls,
                  onChanged: onChanged,
                ),
              )),
            ),
          ),
        ),
      ],
    ),
  );
}
