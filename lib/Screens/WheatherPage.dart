import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Providers/WheatherProvider.dart';
import 'package:provider/provider.dart';

class WheatherPage extends StatelessWidget {
  String city;
  WheatherPage({super.key, required this.city});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wheather App"), centerTitle: true),
      body: Consumer<WheatherProvider>(
        builder: (context, provider, child) {
          if (provider.wheather == null) {
            provider.fitchWheather(city);
            return Center(child: Text("No Matching Cities with this name 😒"));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${provider.wheather?.cityName}, ${provider.wheather?.countryName}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${provider.wheather?.tempreature}゜C",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${provider.wheather?.weatherCondition}",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.network(
                          "https:${provider.wheather!.weatherConditionIcon}",
                          width: 75,
                          height: 75,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
