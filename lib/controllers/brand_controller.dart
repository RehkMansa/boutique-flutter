import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/brand.dart';
import '../res/strings.dart';
import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/widgets/dialogs.dart';

class BrandController extends GetxController {
  dynamic db;
  var showCard = false.obs;
  var itemList = [].obs;

  Future add(String brand) async {
    var data = Brand.addMap(brand);
    var cat = await db.count(table: Str.brandTable, where: {'brand': brand});

    if (data['brand'].isEmpty) {
      errorDialog('Enter a Brand');
    } else if (cat > 0) {
      errorDialog('Brand already exist');
    } else {
      try {
        await db.insert(table: Str.brandTable, insertData: data);
        successAlert('Brand added successfully');
        fetch();
      } catch (e) {
        errorDialog('Failed to add brand');
        dnd(e);
      }
    }
  }

  Future fetch() async {
    itemList.value = await db.getAll(table: Str.brandTable);
    dnd(itemList);
  }

  Future search(brand) async {
    itemList.value = await db.getAll(
      table: Str.brandTable,
      where: {
        'brand': ['like', '%$brand%'],
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
    await db.delete(table: Str.brandTable, where: {'id': id});
    fetch();
  }
}
