import 'package:flutter/material.dart';

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
          return Column(
            children: [
              ListTile(title: Text(swingNames[index]), onTap: () {}),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
