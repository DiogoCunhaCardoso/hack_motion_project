class SwingAnalysisResult {
  final List<String> issues;
  final bool isGood;

  SwingAnalysisResult({required this.issues}) : isGood = issues.isEmpty;

  String get summary {
    if (isGood) return "Good swing! Wrist angles are within healthy ranges.";
    return "Swing review:\n${issues.join('\n')}\nConsider focusing on wrist control to improve.";
  }
}

class SwingAnalyzer {
  static const double feThreshold = 40.0;
  static const double urThreshold = 30.0;

  static SwingAnalysisResult analyze({
    required double feMin,
    required double feMax,
    required double urMin,
    required double urMax,
  }) {
    final issues = <String>[];

    if (feMax.abs() > feThreshold) {
      issues.add(
        "High wrist extension detected. This can open the clubface and reduce control.",
      );
    }
    if (feMin.abs() > feThreshold) {
      issues.add(
        "High wrist flexion detected. This may reduce swing consistency.",
      );
    }
    if (urMax.abs() > urThreshold) {
      issues.add("Excessive ulnar deviation could disrupt swing timing.");
    }
    if (urMin.abs() > urThreshold) {
      issues.add(
        "Excessive radial deviation often leads to increased wrist extension, opening the clubface and causing shots to go right.",
      );
    }

    return SwingAnalysisResult(issues: issues);
  }
}
