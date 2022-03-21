import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var fieldText = TextEditingController().obs;

  var togglePrint = false.obs;

  var paymentMade = false.obs;

  var checkVisibility = false.obs;

  void doNothing() {
    print('Nothing Happened');
  }

  void clearText() {
    fieldText.value.clear();
    changeVisibility(false);
  }

  void makePayment() {
    paymentMade.toggle().value;
    print('The payment has been made');
  }

  void printToggle({required bool value}) {
    togglePrint.value = value;
  }

  void changeVisibility(value) {
    checkVisibility.value = value;
  }
}
