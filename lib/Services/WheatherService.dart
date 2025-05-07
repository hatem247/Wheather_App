import 'package:dio/dio.dart';
import 'package:holistic_2_wheather_app/Models/Wheather.dart';

class WheatherService {
  static Dio dio = Dio();
  static Future<Wheather?> fitchWheather(String city) async {
    Response response = await dio.get(
      "https://api.weatherapi.com/v1/current.json?q=$city&key=805d8e4621234f858ee72953251903",
    );
    print(response.statusCode);
    print(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return Wheather.fromJson(response.data);
    } else {
      return null;
    }
  }
}
