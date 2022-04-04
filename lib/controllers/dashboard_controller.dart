import 'dart:typed_data';

import 'package:boutique/models/order.dart';
import 'package:boutique/models/ordered_product.dart';
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
  var totalReceiptPrice = 0.obs;
  var itemDescription = '...'.obs;
  var receiptItems = {}.obs;
  var receiptItemsList = [].obs;
  var quantityInputController = TextEditingController(text: '1').obs;

  var data = [].obs;

  var bytes = Uint8List(1).obs;

  var showPrintPreview = false.obs;
  var selectedCash = false.obs;

  var selectedCard = false.obs;

  var selectedTransfer = false.obs;
  var paymentMethodString = ''.obs;

  void clearText() {
    fieldText.value.clear();
    changeVisibility(false);
  }

  void makePayment() {
    if (searchResultList.value.isEmpty) {
      errorDialog('No item has been added to purchase list');
    } else {
      paymentMade.toggle().value;
      selectPaymentMethod('cash');
    }
  }

  void printToggle({required bool value}) {
    //push to database
    togglePrint.value = value;
  }

  void changeVisibility(value) {
    checkVisibility.value = value;
  }

  searchProduct(value) async {
    if (showPrintPreview.value) {
      fieldText.value.clear();
      searchResultList.value = [];
      errorDialog('Print or cancel the current receipt');
    } else {
      if ((value.toString()).isNotEmpty) {
        searchResultList.value = await db.getAll(
          table: Str.productTable,
          where: {
            'name': ['like', '%$value%'],
          },
        );
        if (searchResultList.value.isEmpty) {
          searchResultList.value = await db.getAll(
            table: Str.productTable,
            where: {
              'product_id': ['like', '%$value%'],
            },
          );
        }
      }
    }

    changeVisibility(searchResultList.isNotEmpty);
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
    itemPrice.value = Utils.numberFormat.format(itemObject.value.price);
    itemDescription.value = itemObject.value.description.toString();
    clearText();
  }

  void populateItemFieldsFromEnter(String value) async {
    if (showPrintPreview.value) {
      errorDialog('Print or cancel the current receipt');
    } else {
      if (value.isEmpty) {
        if (itemObject.value.name == null) {
          errorDialog('Select an item to add to receipt list');
        } else {
          if (receiptItems.containsKey(itemObject.value.productId)) {
            errorDialog(
                'Active item has already been added to the receipt list');
          } else {
            var mp = {};
            mp['quantity'] = itemQuantity.toString();
            mp['name'] = itemObject.value.name;
            mp['price'] = itemObject.value.price;
            mp['id'] = itemObject.value.productId;
            receiptItemsList.add(mp);
            int totalPrice = 0;
            receiptItemsList.forEach((element) {
              if (element.toString() != 'item') {
                totalPrice +=
                    (int.parse(element['quantity']) * element['price']).toInt();
              }
            });

            totalReceiptPrice.value = totalPrice;
            dnd(totalPrice);
            receiptItemsList.refresh();
            clearProductObject();
          }
        }
      } else {
        var res = await db.getOne(
          table: Str.productTable,
          where: {
            'name': ['like', '%$value%'],
          },
        );
        if (res.isEmpty) {
          res = await db.getOne(
            table: Str.productTable,
            where: {
              'product_id': ['like', '%$value%'],
            },
          );
        }
        if (!res.isEmpty) {
          itemObject.value = Product.fromJson(res);
          populateItemFields(itemObject.value);
        } else {
          clearText();
          errorDialog('Item not found');
        }
      }
    }
  }

  void selectPaymentMethod(String s) {
    paymentMethodString.value = s;
    paymentMade.value = true;
    switch (s) {
      case 'transfer':
        selectedCash.value = false;
        selectedCard.value = false;
        selectedTransfer.value = true;
        break;
      case 'cash':
        selectedCash.value = true;
        selectedCard.value = false;
        selectedTransfer.value = false;
        break;
      case 'card':
        selectedCash.value = false;
        selectedCard.value = true;
        selectedTransfer.value = false;
        break;
    }
  }

  void clearPurchase() {
    searchResultList.value = [];
    receiptItemsList.value = ['item'];
    showPrintPreview.value = false;
    selectedCash.value = false;
    selectedCard.value = false;
    selectedTransfer.value = false;
    totalReceiptPrice.value = 0;
    clearProductObject();
  }

  void clearProductObject() {
    itemObject.value = Product();
    itemId.value = '...';
    itemName.value = '...';
    itemPrice.value = '...';
    itemDescription.value = '...';
    itemQuantity.value = 1;
    quantityInputController.value.text = 1.toString();
  }

  //add

  Future addOrder() async {
    List<Map<String, dynamic>> orderedProductList = [];
    var totalPrice = 0;
    var orderId = Utils.generateDbId();
    receiptItemsList.value.forEach((element) {
      if (element.toString() != 'item') {
        dnd(element);
        totalPrice += int.parse(element['price'].toString()) *
            (int.parse(element['quantity'].toString()));
        var map = OrderedProduct.addOrderedProductMap(
          order: orderId.toString(),
          amount: element['price'],
          quantity: int.parse(element['quantity'].toString()),
          product: element['id'].toString(),
        );
        orderedProductList.add(map);
      }
    });
    dnd(orderedProductList);

    await db.insert(
        table: Str.orderTable,
        insertData: Order.addOrderMap(
            id: orderId.toString(),
            paid: 1,
            paymentMethod: paymentMethodString.value,
            amount: totalPrice));

    orderedProductList.forEach((element) {
      db.insert(table: Str.orderedProductTable, insertData: element);
    });

    /* await db.insertAll(
        table: Str.orderedProductTable,
        insertData: orderedProductList as List<Map<String, dynamic>>); */
  }
}
