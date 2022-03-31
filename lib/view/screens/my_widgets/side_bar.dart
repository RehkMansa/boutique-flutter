import 'package:flutter/material.dart';

import '../../../res/strings.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 296,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 48, bottom: 48, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(27.0),
                      child: Image.asset(Str.brandImage, width: 54, height: 54),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      Str.brandName,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                padding: EdgeInsets.only(left: 24),
                margin: const EdgeInsets.only(left: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.home),
                    SizedBox(width: 16),
                    Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 32,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.devices_sharp,
                      size: 28,
                      color: Colors.white54,
                    ),
                    SizedBox(width: 24),
                    Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 16, color: Colors.white54),
                    ),
                    SizedBox(width: 84),
                    // Icon(
                    //   Icons.arrow_forward_ios_outlined,
                    //   size: 14,
                    //   color: Colors.white54,
                    // ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 32,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_chart,
                      size: 28,
                      color: Colors.white54,
                    ),
                    SizedBox(width: 24),
                    Text(
                      'Categores',
                      style: TextStyle(fontSize: 16, color: Colors.white54),
                    ),
                    SizedBox(width: 84),
                    // Icon(
                    //   Icons.arrow_forward_ios_outlined,
                    //   size: 14,
                    //   color: Colors.white54,
                    // ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 32,
                margin: const EdgeInsets.only(left: 32, top: 24),
                padding: EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.account_tree_outlined,
                      size: 28,
                      color: Colors.white54,
                    ),
                    SizedBox(width: 24),
                    Text(
                      'Products',
                      style: TextStyle(fontSize: 16, color: Colors.white54),
                    ),
                    SizedBox(width: 84),
                    // Icon(
                    //   Icons.arrow_forward_ios_outlined,
                    //   size: 14,
                    //   color: Colors.white54,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
