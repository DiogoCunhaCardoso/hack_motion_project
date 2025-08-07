import 'package:flutter/material.dart';

class SwingArguments {
  final String swingName;

  SwingArguments({required this.swingName});
}

class SwingDetailsView extends StatelessWidget {
  const SwingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SwingArguments;

    final swingName = args.swingName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Inspection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(swingName), Icon(Icons.delete)],
            ),
            SizedBox(height: 48),
            Text("Swing Graph"),
            SizedBox(height: 16),
            Placeholder(fallbackHeight: 200, fallbackWidth: 1),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text("Previous"),
                  icon: Icon(Icons.adaptive.arrow_back),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("Next"),
                  icon: Icon(Icons.adaptive.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
