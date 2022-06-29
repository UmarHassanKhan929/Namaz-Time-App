import 'package:flutter/material.dart';
import 'package:namaztimeapp/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salah',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        unselectedWidgetColor: Colors.grey,
        backgroundColor: Colors.grey[300],
        fontFamily: 'Segoe UI',
        // textTheme:
      ),
      home: Home(),
    );
  }
}
