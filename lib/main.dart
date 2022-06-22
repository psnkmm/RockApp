import 'package:flutter/material.dart';
import 'package:rock_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MISR Minerals Identify in Sedimentary Rock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: "Lora",
      ),
      home: const HomePage(),
    );
  }
}
