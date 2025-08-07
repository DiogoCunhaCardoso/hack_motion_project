import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';
import 'package:hack_motion_project/routing/routes.dart';

class SwingArguments {
  final int currentIndex;

  SwingArguments({required this.currentIndex});
}

class SwingDetailsView extends StatelessWidget {
  const SwingDetailsView({super.key});

  void _goToPrevious(BuildContext context, int curIndex) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.swingDetails,
      arguments: SwingArguments(currentIndex: curIndex - 1),
    );
  }

  void _goToNext(BuildContext context, int curIndex) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.swingDetails,
      arguments: SwingArguments(currentIndex: curIndex + 1),
    );
  }

  void _deleteSwing(
    BuildContext context,
    int curIndex,
    List<SwingModel> swings,
  ) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Swing ${curIndex + 1} deleted. You are now on a different swing.",
        ),
      ),
    );

    context.read<SwingListCubit>().removeSwing(swings[curIndex]);

    // This makes it if I am on the last swing, it goes to the previous one. Or it just continues.
    final newIndex =
        curIndex >= swings.length - 1 ? swings.length - 2 : curIndex;

    if (newIndex < 0) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(
        context,
        RouteNames.swingDetails,
        arguments: SwingArguments(currentIndex: newIndex),
      );
    }
  }

  //

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
        child: BlocBuilder<SwingListCubit, List<SwingModel>?>(
          builder: (context, swings) {
            if (swings == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (swings.isEmpty) {
              return const Center(
                child: Center(child: Text("This swing is empty")),
              );
            }

            //

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Swing ${curIndex + 1}"),

                    IconButton(
                      onPressed: () => _deleteSwing(context, curIndex, swings),
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),

                SizedBox(height: 48),
                Text("Swing Graph"),
                SizedBox(height: 16),

                Expanded(
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: List.generate(
                            swings[curIndex].flexionExtension.length,
                            (index) => FlSpot(
                              index.toDouble(),
                              swings[curIndex].flexionExtension[index],
                            ),
                          ),
                          isCurved: true,
                          barWidth: 4,
                          color: Color(0xFF00c2bc),
                          dotData: FlDotData(show: false),
                        ),
                        LineChartBarData(
                          spots: List.generate(
                            swings[curIndex].flexionExtension.length,
                            (index) => FlSpot(
                              index.toDouble(),
                              swings[curIndex].ulnarRadial[index],
                            ),
                          ),
                          isCurved: true,
                          barWidth: 4,
                          color: Color(0xFFFF9300),
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),

                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      label: Text("Previous"),
                      icon: Icon(Icons.adaptive.arrow_back),
                      onPressed:
                          curIndex > 0
                              ? () => _goToPrevious(context, curIndex)
                              : null,
                    ),
                    TextButton.icon(
                      label: Text("Next"),
                      icon: Icon(Icons.adaptive.arrow_forward),
                      onPressed:
                          curIndex < swings.length - 1
                              ? () => _goToNext(context, curIndex)
                              : null,
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
