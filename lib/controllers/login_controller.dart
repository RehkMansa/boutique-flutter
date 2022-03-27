import 'package:boutique/core/controller.dart';
import 'package:boutique/models/admin.dart';
import 'package:boutique/res/strings.dart';
import 'package:get/get.dart';

import '../utils/mysql_helper.dart';
import '../utils/utils.dart';
import '../view/screens/dashboard.dart';
import '../view/widgets/dialogs.dart';

class LoginController extends Controller with StateMixin<dynamic> {
  bool isLoading = true;

  Future<dynamic> signIn(String email, String password) async {
    var data = Admin.loginMap(email, password);
    var db = await MySqlHelper.connection();

    try {
      Map dbAdmin = await db.getOne(table: Str.adminTable, where: data);
      if (dbAdmin.isEmpty) {
        errorDialog('Invalid login combination');
      } else {
        Get.off(Dashboard());
        // Get.to(Dashboard());
      }
    } catch (e) {
      dnd(e);
    }

    // ApiResponse response = await Provider().postData('admin/login', data);
    //
    // try {
    //   update();
    //   Admin admin = Admin.fromJson(response.data);
    //   successAlert("${admin.firstName} your login details is correct",
    //       title: 'Congratulation');
    //  // _updateIsLoading(false);
    //   return null;
    // } catch (err) {
    //   errorDialog(err.toString() + '\nError in loin response data');
    //   //_updateIsLoading(false);
    // }

    // Admin admin = Admin(
    //   id: '7',
    //   firstName: 'Admin',
    //   surname: 'Admin',
    //   emailAddress: 'admin@admin.com',
    //   phoneNumber: '08067324444',
    //   password: 'password',
    //   blocked: 0,
    //   active: 1,
    // );
    //
    // var db = await MySqlHelper.connection();
    // await db.insert(table: Str.adminTable, insertData: admin.toJson());
  }

//Check state controller
  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
  // @override
  // void onInit() {
  //   super.onInit();

  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
