import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getData(String url) async {
    final response = await get(
        'http://www.json-generator.com/api/json/get/cfrJFXLTAO?indent=2');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> postData(String url, Map<String, dynamic> data) async {
    final response = await post('url', data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}

class Request extends GetxController with StateMixin<dynamic> {
  late final String url;
  late final Map<String, dynamic> data;

  @override
  void onInit() {
    super.onInit();
    // Provider().getUser().then((value) {
    //   change(value, status: RxStatus.success());
    // }, onError: (error) {
    //   change(null, status: RxStatus.error(error.toString()));
    // });
  }

  // Future<dynamic> getData(String url) async {
  //   final response = await get(
  //       'http://www.json-generator.com/api/json/get/cfrJFXLTAO?indent=2');
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText!);
  //   } else {
  //     return response.body;
  //   }
  // }

  // Future<dynamic> postData(String url, Map<String, dynamic> data) async {
  //   final response = await post('url', data);
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText!);
  //   } else {
  //     return response.body;
  //   }
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
