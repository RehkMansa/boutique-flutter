import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingIcon extends StatelessWidget {
  final DashboardController controller;
  final Widget icon;
  final Function onPressed;
  const FloatingIcon(
      {Key? key,
      required this.controller,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: (controller.paymentMade.value)
                  ? Color(0xFF091222)
                  : Colors.white70,
              border: Border.all(
                  color: (controller.paymentMade.value)
                      ? Color(0xFF091222)
                      : Colors.white70),
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            color: (controller.paymentMade.value) ? Colors.white : null,
            icon: icon,
            onPressed: () {},
          ),
        ),
      );
    }));
  }
}
