import 'package:boutique/core/controller.dart';
import 'package:boutique/models/admin.dart';
import 'package:boutique/models/api_response.dart';
import 'package:boutique/services/provider.dart';
import 'package:boutique/view/widgets/dialogs.dart';
import 'package:get/get.dart';

class LoginController extends Controller with StateMixin<dynamic> {
  Future<dynamic> signIn(String email, String password) async {
    var data = Admin.loginMap(email, password);

    ApiResponse response = await Provider().postData('admin/login', data);

    try {
      Admin admin = Admin.fromJson(response.data);
      successAlert("${admin.firstName} your login details is correct",
          title: 'Congratulation');
      return null;
    } catch (err) {
      errorDialog(err.toString() + '\nError in loin response data');
    }
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
