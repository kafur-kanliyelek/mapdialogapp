import 'package:flutter/material.dart';
import 'package:map_dialog_app/core/constants/constants.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(MyConstants.vazgec));
  }
}
