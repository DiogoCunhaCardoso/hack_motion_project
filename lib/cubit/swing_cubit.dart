import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: change to swingModel when using the actual data
class SwingListCubit extends Cubit<List<String>> {
  SwingListCubit() : super([]);

  static const List<String> swingNames = [
    "Test Swing 1",
    "Swing 2",
    "Swing 3",
    "Swing 4",
    "Swing 5",
  ];

  void loadSwings(List<String> swings) {
    emit(swings);
  }
}
