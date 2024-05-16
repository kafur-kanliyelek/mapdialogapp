import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_dialog_app/core/constants/constants.dart';
import 'package:map_dialog_app/feature2/bloc/cleanmap_bloc.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    super.key,
    required this.problem,
  });

  final CleanProblemModel problem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          BlocProvider.of<CleanmapBloc>(context)
              .add(DeleteDataEvent(id: problem.id!));
        },
        icon: const Icon(
          MyConstants.deleteIcon,
          color: Colors.red,
        ));
  }
}
