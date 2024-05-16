import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_dialog_app/core/constants/constants.dart';
import 'package:map_dialog_app/feature2/bloc/cleanmap_bloc.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';
import 'package:map_dialog_app/feature2/cubit/cubit/comment_cubit.dart';
import 'package:map_dialog_app/feature2/cubit/option_cubit.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.optionList,
    required this.position,
    required this.comment,
  });

  final List optionList;
  final GeoPoint position;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          inspect(comment);
          BlocProvider.of<CleanmapBloc>(context).add(CreateDataEvent(
              problem: CleanProblemModel(
            option: optionList[
                BlocProvider.of<OptionCubit>(context).state.selectedValue],
            position: position,
            time: DateTime.now(),
            comment: BlocProvider.of<CommentCubit>(context).state.comment,
          )));
          Navigator.pop(context);
        },
        child: const Text(MyConstants.ekle));
  }
}
