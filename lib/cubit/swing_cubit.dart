import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';
import 'package:hack_motion_project/data/service/jsons/json_loader.dart';
import 'package:logger/logger.dart';

class SwingListCubit extends Cubit<List<SwingModel>?> {
  final SwingJsonLoader _loader;
  final Logger _logger = Logger();

  SwingListCubit(this._loader) : super(null);

  Future<void> loadSwings() async {
    final swings = await _loader.loadSwings();
    emit(swings);
  }

  void removeSwing(SwingModel swing) {
    if (state == null) return;
    emit(state!.where((s) => s != swing).toList());
    _logger.i('Removed swing successfully');
  }
}
