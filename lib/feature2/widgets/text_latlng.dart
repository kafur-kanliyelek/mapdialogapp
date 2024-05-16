import 'package:flutter/material.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';

class LatLngText extends StatelessWidget {
  const LatLngText({
    super.key,
    required this.problem,
  });
  final CleanProblemModel problem;

  @override
  Widget build(BuildContext context) {
    return Text(
        '${problem.position.latitude.toStringAsFixed(3)} - ${problem.position.longitude.toStringAsFixed(3)}');
  }
}
