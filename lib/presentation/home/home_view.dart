import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/cubit/swing_cubit.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';
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
      body: BlocBuilder<SwingListCubit, List<SwingModel>?>(
        builder: (context, swings) {
          if (swings == null) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading your swings"),
                ],
              ),
            );
          }

          if (swings.isEmpty) {
            return const Center(child: Text("No swings available"));
          }

          //

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: swings.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text('Swing ${index + 1}'),
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          RouteNames.swingDetails,
                          arguments: SwingArguments(currentIndex: index),
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
