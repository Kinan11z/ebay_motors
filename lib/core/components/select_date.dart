import 'package:flutter/material.dart';

Future<void> selectData(
    BuildContext context, TextEditingController birthday) async {
  DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2060));

  if (_pickedDate != null) {
    birthday.text = _pickedDate.toString();
  }
}

Future<void> selectYearRange(
    BuildContext context, TextEditingController launchYear) async {
  final DateTime? startYear = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 10),
    lastDate: DateTime(DateTime.now().year + 10),
    initialDatePickerMode: DatePickerMode.year,
  );

  final DateTime? endYear = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 10),
    lastDate: DateTime(DateTime.now().year + 10),
    initialDatePickerMode: DatePickerMode.year,
  );

  if (startYear != null && endYear != null) {
    launchYear.text = ' ${startYear.year} - ${endYear.year}';
  }
}
