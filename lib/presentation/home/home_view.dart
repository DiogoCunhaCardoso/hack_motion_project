import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/presentation/swing_details/swing_details.dart';
import 'package:hack_motion_project/routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Home"),
        centerTitle: true,
      ),
      // TODO: change to list of swings when real data is on
      body: BlocBuilder<SwingListCubit, List<String>>(
        builder: (context, swings) {
          if (swings.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: swings.length,
            itemBuilder: (context, index) {
              final currentSwingName = swings[index];

              return Column(
                children: [
                  ListTile(
                    title: Text(currentSwingName),
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          RouteNames.swingDetails,
                          arguments: SwingArguments(
                            swingName: currentSwingName,
                          ),
                        ),
                    trailing: Icon(Icons.adaptive.arrow_forward),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
