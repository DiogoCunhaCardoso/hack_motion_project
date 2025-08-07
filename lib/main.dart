import 'package:flutter/material.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => SwingListCubit()..loadSwings(SwingListCubit.swingNames),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack Motion Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      debugShowCheckedModeBanner: false,

      // routing
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
