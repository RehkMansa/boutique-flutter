import 'package:get/get.dart';

class TestController extends GetxController {
  bool isLoading = false;

  String data = '';

  Future<void> fetchData() async {
    isLoading = true;
    update(); // triggers the GetBuilder rebuild
    await Future.delayed(
      const Duration(seconds: 2),
      () => data = 'Data Loaded',
    );
    isLoading = false;
    update();
  }
}