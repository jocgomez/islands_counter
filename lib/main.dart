import 'package:flutter/material.dart';
import 'package:islands_counter/pages/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tres astronautas',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeView(),
    );
  }
}
