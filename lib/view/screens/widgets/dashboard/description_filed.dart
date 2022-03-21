import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Row(children: [
        Container(
          width: 150,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          //padding:const EdgeInsets.all(20),
          child: const Align(
            child: Text('Description', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: 625,
          height: 100,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: const Align(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ]),
    );
  }
}
