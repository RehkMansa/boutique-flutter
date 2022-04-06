import 'package:boutique/view/screens/create_product.dart';
import 'package:boutique/view/screens/products.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class ProductController extends GetxController {
  var db;
  var showCard = false.obs;
  var globalProductId = ''.obs;
  var showCardQty = false.obs;
  var showCardPrice = false.obs;
  var itemList = [].obs;

  var categoryDropdown = ['--Select category--'].obs;
  var brandDropdown = ['--Select brand--'].obs;
  var subcategoryDropdown = ['--Select subcategory--'].obs;

  Future add(
      {name,
      productId,
      price,
      brand,
      category,
      subcategory,
      quantity,
      quantitySold,
      description}) async {
    try {
      var data = Product.addProductMap(
          name: name!,
          productId: productId,
          price: price,
          brand: brand,
          category: category,
          subcategory: subcategory,
          quantity: quantity,
          quantitySold: quantitySold,
          description: description);
      var productHistory = Product.addProductHistoryMap(
        name: name!,
        productId: productId,
        price: price,
        brand: brand,
        category: category,
        subcategory: subcategory,
        description: description,
        quantity: quantity,
      );
      var priceHistory = Product.addPriceHistoryMap(
        name: name!,
        price: price,
        productId: productId,
      );
      var dbProduct = await db
          .count(table: Str.productTable, where: {'product_id': productId});
      if ((data['price'] == '') &&
          (data['quantity'] == '--Select quantity--')) {
        errorDialog(
            'Please provide valid details for either Quantity or Price');
      } else {
        if (dbProduct > 0) {
          actionAlert(
              'A product with this id already exist.\nWill you like to update the quantity of this item?',
              confirmAction: () async => await updateProduct(
                  price: data['price'],
                  quantity: (data['quantity']).toString(),
                  productId: data['product_id']));
        } else if (name.isEmpty || price == null || quantity == null) {
          errorDialog('All fields with (*) are mandatory');
        } else {
          try {
            await db.insert(table: Str.productTable, insertData: data);
            await db.insert(
                table: Str.productHistoryTable, insertData: productHistory);
            await db.insert(
                table: Str.priceHistoryTable, insertData: priceHistory);
            successAlert('Product added successfully !!!');
            fetch();
          } catch (e) {
            dnd(e.toString());
            errorDialog('Failed to add product !!!');
          }
        }
      }
    } catch (e) {
      errorDialog(e.toString());
    }
  }

  Future updateProduct(
      {required productId,
      price,
      quantity,
      quantitySold,
      Widget? redirectRoute}) async {
    var data = {};
    var dbItem = await db.getOne(
        table: Str.productTable, where: {'product_id': productId.toString()});
    dnd(dbItem);
    if (price != null && price != '') {
      data['price'] = price;
      var priceHistory = Product.addPriceHistoryMap(
        name: dbItem['name'],
        price: price,
        productId: productId,
      );
      await db.insert(table: Str.priceHistoryTable, insertData: priceHistory);
    }
    if (quantity != null && quantity != '--Select quantity--') {
      data['quantity'] = (int.parse(quantity) + (dbItem['quantity']));
      data['quantity_remaining'] =
          (int.parse(quantity) + dbItem['quantity_remaining']);
      var productHistory = Product.addProductHistoryMap(
        name: dbItem['name'],
        productId: productId,
        price: dbItem['price'],
        brand: dbItem['brand'],
        category: dbItem['category'],
        subcategory: dbItem['subcategory'],
        description: dbItem['description'],
        quantity: quantity,
      );
      await db.insert(
          table: Str.productHistoryTable, insertData: productHistory);
    }
    if (quantitySold != null) {
      data['quantity_sold'] = quantitySold + dbItem['quantity_sold'];
      data['quantity_remaining'] = dbItem['quantity_remaining'] - quantitySold;
    }
    await db.update(
        table: Str.productTable,
        updateData: data,
        where: {'product_id': productId});
    if (redirectRoute != null) Get.offAll(() => redirectRoute);
  }

  Future fetch() async {
    itemList.value = await db.getAll(table: Str.productTable);
    dnd(itemList.value);
  }

  Future listBrand() async {
    List dbItems = await db.getAll(table: Str.brandTable);
    var list = dbItems.map((e) {
      return e['brand'].toString();
    }).toList();
    brandDropdown.value = ['--Select brand--', ...list];
  }

  Future listCategories() async {
    List dbItems = await db.getAll(table: Str.categoryTable);

    var list = dbItems.map((e) {
      return e['category'].toString();
    }).toList();
    categoryDropdown.value = ['--Select category--', ...list];
  }

  Future listSubcategories() async {
    List dbItems = await db.getAll(table: Str.subcategoryTable);
    var list = dbItems.map((e) {
      return e['subcategory'].toString();
    }).toList();
    subcategoryDropdown.value = ['--Select subcategory--', ...list];
  }

  Future search(name) async {
    itemList.value = await db.getAll(
      table: Str.productTable,
      where: {
        'name': ['like', '%$name%'],
        // 'product_id': ['like', '%$category%'],
      },
    );
  }

  toggleCard() {
    showCard.value = showCard.value ? false : true;
  }

  closeCard() {
    showCardQty.value = false;
    showCardPrice.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
    db = await MySqlHelper().connection();
  }

  delete(String id) async {
    dnd(id);
    await db.delete(table: Str.categoryTable, where: {'id': id});
    fetch();
  }
}
