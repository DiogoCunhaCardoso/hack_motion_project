import 'package:flutter/material.dart';
import 'package:hack_motion_project/presentation/swing_details/swing_details.dart';
import 'package:hack_motion_project/routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<String> swingNames = [
    "Swing 1",
    "Swing 2",
    "Swing 3",
    "Swing 4",
    "Swing 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: swingNames.length,
        itemBuilder: (context, index) {
          final currentSwingName = swingNames[index];

          return Column(
            children: [
              ListTile(
                title: Text(currentSwingName),
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      RouteNames.swingDetails,
                      arguments: SwingArguments(swingName: currentSwingName),
                    ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
