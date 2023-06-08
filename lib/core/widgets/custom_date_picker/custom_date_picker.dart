import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:reddit_posts/core/extensions/extensions.dart';
import 'package:reddit_posts/core/widgets/custom_text_form_field/custom_text_form_field.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    Key? key,
    required this.fieldKey,
    required this.controller,
    required this.onChange,
    DateTime? initialDate,
    required this.label,
    this.validator,
  })  : initialDate = initialDate ?? DateTime.now(),
        super(key: key);

  final GlobalKey<FormFieldState> fieldKey;
  final MaskedTextController controller;
  final void Function(DateTime) onChange;
  final String label;
  final String? Function(String?)? validator;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    void onChangeDatePicker(DateTime? date) {
      if (date != null) {
        onChange(date);
      }
    }

    return CustomTextFormField(
      labelText: label,
      keyboardType: TextInputType.datetime,
      controller: controller,
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime.now().addMonths(-3).firstHourOfDay,
          lastDate: DateTime.now().addMonths(3).lastHourOfDay,
        ).then((value) => onChangeDatePicker(value));
      },
      validator: validator,
    );
  }
}
