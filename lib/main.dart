import 'package:flutter/material.dart';
import 'package:hack_motion_project/presentation/home/home_view.dart';
import 'package:hack_motion_project/presentation/swing_details/swing_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack Motion Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView(), //SwingDetailsView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
