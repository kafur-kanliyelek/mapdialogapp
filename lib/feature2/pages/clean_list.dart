import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_dialog_app/core/constants/constants.dart';
import 'package:map_dialog_app/feature2/bloc/cleanmap_bloc.dart';
import 'package:map_dialog_app/feature2/widgets/problems_list.dart';

class CleanList extends StatelessWidget {
  const CleanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MyConstants.sorunListesiBaslik)),
      body: BlocBuilder<CleanmapBloc, CleanmapState>(
        builder: (context, state) {
          if (state is CleanmapLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CleanmapFailure) {
            return const Center(child: Text(MyConstants.beklenmedikHata));
          }
          if (state is CleanmapLoaded) {
            final problems = state.problems;
            return problems.isEmpty
                ? const Center(child: Text(MyConstants.bosListeMetni))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProblemsList(problems: problems),
                    ),
                  );
          }
          return const Center(child: LinearProgressIndicator());
        },
      ),
    );
  }
}
