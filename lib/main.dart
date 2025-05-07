import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Providers/UserProvider.dart';
import 'package:holistic_2_wheather_app/Providers/WheatherProvider.dart';
import 'package:holistic_2_wheather_app/Screens/LoginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => WheatherProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Loginpage(),
    );
  }
}
