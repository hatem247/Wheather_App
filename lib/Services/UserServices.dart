import 'package:dio/dio.dart';
import 'package:holistic_2_wheather_app/Models/User.dart';

class UserService {
  static Dio dio = Dio();
  static Future<User> login({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Login/CheckUser",
      data: {"email": email, "password": password},
    );
    print(response.statusCode);
    print(response.data);
    if (response.statusCode! >= 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception("Couldn't fitch data");
    }
  }

  static Future<User> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Register/AddUser",
      data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      },
    );
    print(response.statusCode);
    print(response.data);
    if (response.statusCode! >= 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception("Couldn't fitch data");
    }
  }
}
