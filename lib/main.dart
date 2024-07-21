import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login_screen.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open a Hive box
  await Hive.openBox('userBox');

  // Run the Flutter application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
