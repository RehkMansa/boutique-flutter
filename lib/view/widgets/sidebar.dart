import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        margin: EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black87,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sideBarIcon('home.png'),
                sideBarIcon('home.png'),
                sideBarIcon('home.png'),
                sideBarIcon('home.png'),
                sideBarIcon('home.png'),
              ]),
        ),
      ),
    );
  }
}

sideBarIcon(String iconImage) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Color(0xFFDADEE4)),
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        child: Image.asset(
          'assets/images/$iconImage',
          color: Color(0xFF091222),
          height: 25,
          width: 25,
        ),
      ));
}
