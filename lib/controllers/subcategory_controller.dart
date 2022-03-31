import 'package:boutique/models/subcategory.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class SubcategoryController extends GetxController {
  var db;
  var showCard = false.obs;
  var itemList = [].obs;

  Future addCategory(String category, String subcategory) async {
    var data = Subcategory.addMap(category, subcategory);
    var cat = await db.count(table: Str.subcategoryTable, where: {'category': category, 'subcategory': subcategory});

    if (data['category'].isEmpty || data['subcategory'].isEmpty) {
      errorDialog('Enter a Category and subcategory');
    } else if (cat > 0) {
      errorDialog('Subcategory already exist for this category');
    } else {
      try {
        await db.insert(table: Str.subcategoryTable, insertData: data);
        successAlert('Category added successfully');
        fetchListItems();
      } catch (e) {
        errorDialog('Failed to add category');
        dnd(e);
      }
    }
  }

  Future fetchListItems() async {
    itemList.value = await db.getAll(table: Str.subcategoryTable);
  }

  Future searchCategory(subcategory) async {
    itemList.value = await db.getAll(
      table: Str.subcategoryTable,
      where: {
        'category': ['like', '%$subcategory%'],
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
    dnd('Connection stated');
  }

  deleteCategory(String id) async {
    await db.delete(table: Str.subcategoryTable, where: {'id': id});
    fetchListItems();
  }
}
