class User {
  bool status;
  String message;
  User({required this.status, required this.message});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(status: json['status'], message: json['message']);
  }
}
