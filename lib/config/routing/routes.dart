import 'package:flutter/material.dart';
import 'package:hack_motion_project/presentation/home/home_view.dart';
import 'package:hack_motion_project/presentation/swing_details/swing_details.dart';

abstract final class RouteNames {
  static const String home = "/";
  static const String swingDetails = "/swing";
}

abstract final class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      case RouteNames.swingDetails:
        return MaterialPageRoute(
          builder: (_) => SwingDetailsView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
