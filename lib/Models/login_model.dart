class LoginModel {
  final bool firstLogin;
  final String? firstLoginToken;
  final int? userId;

  LoginModel({
    this.firstLogin = false,
    this.firstLoginToken,
    this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    firstLogin: json["first_login"]??false,
    firstLoginToken: json["first_login_token"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "first_login": firstLogin,
    "first_login_token": firstLoginToken,
    "user_id": userId,
  };
}