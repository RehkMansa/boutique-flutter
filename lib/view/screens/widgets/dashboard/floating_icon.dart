import 'package:boutique/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

class FloatingIcon extends StatelessWidget {
  final DashboardController controller;
  final bool selected;
  final Widget icon;
  final Function() onPressed;
  const FloatingIcon({Key? key, required this.controller, required this.onPressed, required this.icon, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: selected ? Color(0xFF091222) : Colors.white70,
            border: Border.all(color: selected ? Color(0xFF091222) : Colors.white70),
            borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          color: selected ? Colors.white : null,
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
