import 'package:flutter/material.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';
import 'package:map_dialog_app/feature2/widgets/iconbutton_delete.dart';
import 'package:map_dialog_app/feature2/widgets/text_date.dart';
import 'package:map_dialog_app/feature2/widgets/text_latlng.dart';

class ProblemsList extends StatelessWidget {
  const ProblemsList({
    super.key,
    required this.problems,
  });

  final List<CleanProblemModel> problems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: problems.map((problem) {
        var newTime = problem.time;
        return ListTile(
          title: Text(problem.option),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatLngText(
                problem: problem,
              ),
              Text('${problem.comment}'),
              DateText(newTime: newTime)
            ],
          ),
          trailing: DeleteIconButton(
            problem: problem,
          ),
        );
      }).toList()),
    );
  }
}
