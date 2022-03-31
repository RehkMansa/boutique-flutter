import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class DashboardController extends GetxController {
  dynamic db;
  var fieldText = TextEditingController().obs;

  var togglePrint = false.obs;

  var paymentMade = false.obs;

  var checkVisibility = false.obs;

  var searchResultList = [].obs;
  var itemObject = Product().obs;

  var itemName = '...'.obs;
  var itemPrice = '...'.obs;
  var itemId = '...'.obs;
  var itemQuantity = 1.obs;
  var itemDescription = '...'.obs;
  var receiptItems = {}.obs;
  var receiptItemsList = [].obs;

  void clearText() {
    fieldText.value.clear();
    changeVisibility(false);
  }

  void makePayment() {
    paymentMade.toggle().value;
  }

  void printToggle({required bool value}) {
    togglePrint.value = value;
  }

  void changeVisibility(value) {
    checkVisibility.value = value;
  }

  searchProduct(value) async {
    if ((value.toString()).isNotEmpty) {
      searchResultList.value = await db.getAll(
        table: Str.productTable,
        where: {
          'name': ['like', '%$value%'],
          // 'product_id': ['like', '%$category%'],
        },
      );

      changeVisibility(searchResultList.isNotEmpty);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    db = await MySqlHelper().connection();
    receiptItemsList.add('item');
  }

  populateItemFields(Product object) {
    itemObject.value = object;
    itemId.value = itemObject.value.productId!;
    itemName.value = itemObject.value.name!;
    itemPrice.value = itemObject.value.price.toString();
    itemDescription.value = itemObject.value.description.toString();
    clearText();
  }

  void populateItemFieldsFromEnter(String value) async {
    if (value.isEmpty) {
      if (itemObject.value.name == null) {
        errorDialog('Select an item to add to receipt list');
      } else {
        if (receiptItems.value.containsKey(itemObject.value.productId)) {
          errorDialog('Active item has already been added to the receipt list');
        } else {
          var mp = {};
          mp['quantity'] = itemObject.value.quantity.toString();
          mp['name'] = itemObject.value.name;
          mp['price'] = itemObject.value.price.toString();
          mp['id'] = itemObject.value.productId;
          receiptItemsList.value.add(mp);
          receiptItemsList.refresh();
          successAlert('message');
        }
      }
    } else {
      var res = await db.getOne(
        table: Str.productTable,
        where: {
          'name': ['like', '%$value%'],
          // 'product_id': ['like', '%$category%'],
        },
      );
      if (res.isEmpty) {
        res = await db.getOne(
          table: Str.productTable,
          where: {
            'product_id': ['like', '%$value%'],
            // 'product_id': ['like', '%$category%'],
          },
        );
      }
      if (!res.isEmpty) {
        itemObject.value = Product.fromJson(res);
        populateItemFields(itemObject.value);
      } else {
        clearText();
        errorDialog('Item not found');
        dnd(value);
      }
    }
  }
}
