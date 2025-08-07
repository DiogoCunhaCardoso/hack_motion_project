import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';

class SwingArguments {
  final int currentIndex;

  SwingArguments({required this.currentIndex});
}

class SwingDetailsView extends StatelessWidget {
  const SwingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SwingArguments;

    final curIndex = args.currentIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Inspection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<SwingListCubit, List<SwingModel>>(
          builder: (context, swings) {
            if (swings.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Swing ${curIndex + 1}"), Icon(Icons.delete)],
                ),
                SizedBox(height: 48),
                Text("Swing Graph"),
                SizedBox(height: 16),
                Placeholder(fallbackHeight: 200, fallbackWidth: 1),

                // ok I am getting the data :)
                Text(swings[curIndex].flexionExtension[0].toString()),

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
            );
          },
        ),
      ),
    );
  }
}
