import 'package:flutter/material.dart';
import 'package:hack_motion_project/config/theme/common.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/data/service/jsons/json_loader.dart';
import 'package:hack_motion_project/config/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => SwingListCubit(SwingJsonLoader())..loadSwings(),
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

      // styling
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        appBarTheme: CustomWidgetStyles.getAppBarTheme(
          ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
      ),

      debugShowCheckedModeBanner: false,

      // routing
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
