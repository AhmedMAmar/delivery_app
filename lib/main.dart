import 'package:delivery/screen/order_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'delivery app',
      theme: ThemeData(
        backgroundColor: const Color(0xFFEFEFEF),
        primarySwatch: Colors.blue,
      ),
      home: const OrderScreen(),
    );
  }
}
