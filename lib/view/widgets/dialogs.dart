import 'package:boutique/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double maxWidth = 100;
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
    radius: 8,
    titlePadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
    titleStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: successTextColor),
    backgroundColor: successBackgroundColor,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline, color: successTextColor),
        const SizedBox(width: 8),
        Text(
          message,
          style: TextStyle(color: successTextColor, fontSize: 18),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}

actionAlert(
  String message, {
  title = 'Success message',
  cancelText = 'Cancel',
  confirmText = 'Ok',
  required Function() confirmAction,
}) {
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
    actions: [
      SizedBox(
        width: maxWidth,
        child: ButtonTheme(
          minWidth: Get.width,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(cancelText),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.infinity, 48),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: maxWidth,
        child: ButtonTheme(
          minWidth: Get.width,
          child: ElevatedButton(
            onPressed: confirmAction,
            child: Text(confirmText),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: const Size(double.infinity, 48),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
