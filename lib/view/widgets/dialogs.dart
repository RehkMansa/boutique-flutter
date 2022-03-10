import 'package:boutique/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorDialog(String message, {title = 'Error message'}) {
  Get.defaultDialog(
    title: title,
    radius: 0,
    titlePadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
    titleStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: errorTextColor),
    backgroundColor: errorBackgroundColor,
    content: Row(
      children: [
        Icon(Icons.warning, color: errorTextColor),
        const SizedBox(width: 8),
        Text(
          message,
          style: TextStyle(color: errorTextColor),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}

successAlert(String message, {title = 'Success message'}) {
  Get.defaultDialog(
    title: title,
    radius: 0,
    titlePadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
    titleStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: successTextColor),
    backgroundColor: successBackgroundColor,
    content: Row(
      children: [
        Icon(Icons.check_circle_outline, color: successTextColor),
        const SizedBox(width: 8),
        Text(
          message,
          style: TextStyle(color: successTextColor),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}
