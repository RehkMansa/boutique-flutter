class ApiResponse {
  bool? status;
  String? message;
  dynamic data;

  ApiResponse({this.status, this.message, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] ?? {};
  }

  Map<String, dynamic> toJson() {
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = data;
    }
    return data;
  }
}
