import 'package:boutique/config/app.dart';
import 'package:boutique/models/api_response.dart';
import 'package:boutique/view/widgets/dialogs.dart';
import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getData(String url, {Map<String, dynamic>? params}) async {
    url = baseUrl + url;
    final response = await get(url, query: params, headers: requestHeader);
    errorDialog('err.toString()');
    if (response.isOk && response.statusCode == 200) {
      try {
        errorDialog('err.toString()');
        return ApiResponse.fromJson(response.body);
      } catch (err) {
        errorDialog(err.toString());
      }
    }
    return Future.error(response.statusText!);
  }

  Future<dynamic> postData(String url, Map<String, dynamic> data) async {
    url = baseUrl + url;
   
    final response = await post('https://google.com', data, headers: requestHeader);
    
    if (response.isOk && response.statusCode == 200) {
      try {
        return ApiResponse.fromJson(response.body);
      } catch (err) {
        errorDialog(err.toString() + '\nError in API response data');
        return null;
      }
    }

    errorDialog(response.statusText!);
    return Future.error(response.statusText!);
  }
}
