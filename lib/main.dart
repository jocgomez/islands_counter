import 'package:flutter/material.dart';
import 'package:islands_counter/data/get_it_locator.dart';
import 'package:islands_counter/pages/home_view.dart';
import 'package:islands_counter/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locator.setUpLocator();
  await locator.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tres astronautas',
      theme: getApplicationTheme(),
      home: const HomeView(),
    );
  }
}
