import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key, this.searchFunction}) : super(key: key);
  // final TextEditingController? controller;
  final Function(String)? searchFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      height: 50,
      margin: const EdgeInsets.only(top: 48, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: searchFunction,
            // controller: searchController,
            decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 30, left: 10),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: null,
                ),
                hintText: 'Enter Product Name',
                border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
