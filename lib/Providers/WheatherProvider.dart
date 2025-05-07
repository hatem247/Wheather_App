import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Models/Wheather.dart';
import 'package:holistic_2_wheather_app/Services/WheatherService.dart';

class WheatherProvider extends ChangeNotifier {
  Wheather? wheather;
  Future<void> fitchWheather(String city) async {
    wheather = await WheatherService.fitchWheather(city);
    notifyListeners();
  }
}
