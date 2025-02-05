/// status : "failure"
/// message : "none"

class LoginResponseError {
  LoginResponseError({
      this.status, 
      this.message,});

  LoginResponseError.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}