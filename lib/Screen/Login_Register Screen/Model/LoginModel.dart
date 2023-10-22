class LoginModel {
  bool? status;

  String? message;
  UserModel? data;

  LoginModel.fromjeson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromjeson(json['data']) : null;
  }
}

class UserModel {
  int? id;

  String? name;

  String? email;

  String? phone;

  String? image;

  int? points;

  int? credit;

  String? token;

  UserModel.fromjeson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
