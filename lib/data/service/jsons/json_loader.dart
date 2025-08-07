// read from 1st response - https://stackoverflow.com/questions/71294190/how-to-read-local-json-file-in-flutter

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hack_motion_project/data/mapper/swing_mapper.dart';
import 'package:hack_motion_project/data/model/swing_model.dart';

import 'package:logger/logger.dart';

class SwingJsonLoader {
  final Logger _logger = Logger();

  Future<List<SwingModel>> loadSwings() async {
    List<SwingModel> swings = [];

    try {
      for (int i = 1; i <= 5; i++) {
        final String jsonStr = await rootBundle.loadString(
          'lib/data/service/jsons/$i.json',
        );

        final Map<String, dynamic> json = jsonDecode(jsonStr);
        final mapper = SwingMapper.fromJson(json);
        swings.add(mapper.toModel());
      }

      _logger.i('Successfully loaded ${swings.length} swings.');
    } catch (e, stackTrace) {
      _logger.e('Failed to load swings: $e', error: e, stackTrace: stackTrace);
    }

    return swings;
  }
}
