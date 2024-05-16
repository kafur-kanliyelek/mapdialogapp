import 'package:flutter/material.dart';

import '../pages/clean_list.dart';

class GoToIconButton extends StatelessWidget {
  const GoToIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CleanList()),
          );
        },
        icon: Icon(Icons.list_alt_rounded));
  }
}
