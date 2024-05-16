import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_dialog_app/feature2/cubit/option_cubit.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({
    super.key,
    required this.optionList,
  });

  final List optionList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: optionList.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              title: Text('${optionList[index]}'),
              value: index,
              onChanged: (value) {
                BlocProvider.of<OptionCubit>(context)
                    .updateSelectedValue(value);
              },
              groupValue:
                  BlocProvider.of<OptionCubit>(context).state.selectedValue,
            );
          }),
    );
  }
}
