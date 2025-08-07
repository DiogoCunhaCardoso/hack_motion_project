import 'package:hack_motion_project/data/model/swing_model.dart';

class SwingMapper {
  final List<double> flexionExtension;
  final List<double> ulnarRadial;

  SwingMapper({required this.flexionExtension, required this.ulnarRadial});

  // from JSON

  factory SwingMapper.fromJson(Map<String, dynamic> json) {
    final params = json['parameters'] as Map<String, dynamic>;

    final flexEx = params['HFA_crWrFlexEx']['values'] as List? ?? [];
    final ulnRad = params['HFA_crWrRadUln']['values'] as List? ?? [];

    return SwingMapper(
      flexionExtension: flexEx.map((e) => (e as num).toDouble()).toList(),
      ulnarRadial: ulnRad.map((e) => (e as num).toDouble()).toList(),
    );
  }

  // to Model

  SwingModel toModel() {
    return SwingModel(
      flexionExtension: flexionExtension,
      ulnarRadial: ulnarRadial,
    );
  }

  // to JSON (if I need in the future)

  Map<String, dynamic> toJson() => {
    'flexExValues': flexionExtension,
    'radUlnValues': ulnarRadial,
  };
}
