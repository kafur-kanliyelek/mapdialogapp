import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required this.newTime,
  });

  final DateTime? newTime;

  @override
  Widget build(BuildContext context) {
    return Text(
        DateFormat('dd/MM/yyyy HH:mm').format(newTime ?? DateTime(2019)));
  }
}
