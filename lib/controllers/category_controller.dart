import 'package:boutique/models/category.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class CategoryController extends GetxController {
  var db;
  var showCard = false.obs;
  var itemList = [].obs;
  var dropDownList = [].obs;

  Future add(String category) async {
    var data = Category.addMap(category);
    var cat = await db.count(table: Str.categoryTable, where: {'category': category});

    if (data['category'].isEmpty) {
      errorDialog('Enter a Category');
    } else if (cat > 0) {
      errorDialog('Category already exist');
    } else {
      try {
        await db.insert(table: Str.categoryTable, insertData: data);
        successAlert('Category added successfully');
        fetch();
      } catch (e) {
        errorDialog('Failed to add category');
        dnd(e);
      }
    }
  }

  Future listCategories() async {
    List dbItems = await db.getAll(table: Str.categoryTable);
    dropDownList.value = dbItems.map((e) {
      return e.category;
    }).toList();
    dnd(dropDownList);
  }

  Future fetch() async {
    itemList.value = await db.getAll(table: Str.categoryTable);
  }

  Future search(category) async {
    itemList.value = await db.getAll(
      table: Str.categoryTable,
      where: {
        'category': ['like', '%$category%'],
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

  delete(String id) async {
    await db.delete(table: Str.categoryTable, where: {'id': id});
    fetch();
  }
}
