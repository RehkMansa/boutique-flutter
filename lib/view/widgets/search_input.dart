import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {

  final DashboardController controller;

  const SearchInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 50,
      margin: const EdgeInsets.only(top: 30, bottom: 30, right: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: ((value) {
              if (value.isNotEmpty) {
                controller.changeVisibility(true);
              } else {
                controller.changeVisibility(false);
              }
            }),
            controller: controller.fieldText.value,
            decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 30, left: 10),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clearText,
                ),
                hintText: 'Enter Product Name',
                border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
