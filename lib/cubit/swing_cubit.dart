import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';
import 'package:hack_motion_project/data/service/jsons/json_loader.dart';

class SwingListCubit extends Cubit<List<SwingModel>> {
  final SwingJsonLoader _loader;

  SwingListCubit(this._loader) : super([]);

  Future<void> loadSwings() async {
    final swings = await _loader.loadSwings();
    emit(swings);
  }
}
