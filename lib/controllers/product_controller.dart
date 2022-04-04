import 'package:get/get.dart';

import '../models/product.dart';
import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class ProductController extends GetxController {
  var db;
  var showCard = false.obs;
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
      var dbProduct = await db
          .count(table: Str.productTable, where: {'product_id': productId});
      dnd(data);
      dnd(dbProduct);
      if (dbProduct > 0) {
        actionAlert(
          'A product with this id already exist.\nWill you like to update the quantity of this item?',
          confirmAction: () async => await updateProduct(
              price: data['price'],
              quantity: data['quantity'],
              productId: data['product_id']),
        );
      } else if (name.isEmpty || price == null || quantity == null) {
        errorDialog('All fields with (*) are mandatory');
      } else {
        try {
          await db.insert(table: Str.productTable, insertData: data);
          successAlert('Category added successfully !!!');
          fetch();
        } catch (e) {
          dnd(e.toString());
          errorDialog('Failed to add category !!!');
        }
      }
    } catch (e) {
      errorDialog(e.toString());
    }
  }

  Future updateProduct({productId, price, quantity, quantitySold}) async {
    var data = {};
    if (price != null) {
      data['price'] = price;
    }
    if (quantity != null) {
      var dbItem = db.getOne(Str.productTable, {'product_id': productId});
      data['quantity'] = quantity + dbItem['quantity'];
      data['quantity_remaining'] = quantity + dbItem['quantity_remaining'];
    }
    if (quantitySold != null) {
      var dbItem = db.getOne(Str.productTable, {'product_id': productId});
      data['quantity_sold'] = quantitySold + dbItem['quantity_sold'];
      data['quantity_remaining'] = dbItem['quantity_remaining'] - quantitySold;
    }
    await db.update(
        table: Str.productTable,
        updateData: data,
        where: {'product_id': productId});
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

  @override
  void onInit() async {
    super.onInit();
    db = await MySqlHelper().connection();
  }

  delete(String id) async {
    await db.delete(table: Str.categoryTable, where: {'id': id});
    fetch();
  }
}
