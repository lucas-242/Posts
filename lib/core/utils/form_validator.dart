import 'package:reddit_posts/core/l10n/generated/l10n.dart';

mixin FormValidator {
  String? validateTextField(String? fieldValue, String fieldName) {
    return _validateIsNullOrEmpty(
      fieldValue: fieldValue,
      fieldName: fieldName,
    );
  }

  String? validateNumberField(String? fieldValue, String fieldName) {
    String? error = _validateIsNullOrEmpty(
      fieldValue: fieldValue,
      fieldName: fieldName,
    );

    if (error != null) {
      return error;
    }

    final convertedValue = double.tryParse(fieldValue!);

    if (convertedValue == null) {
      error = AppLocalizations.current.invalidNumber;
    } else if (convertedValue < 0) {
      error = AppLocalizations.current.numberLesserThanZero;
    }

    return error;
  }

  String? _validateIsNullOrEmpty({String? fieldValue, String? fieldName}) =>
      fieldValue == null || fieldValue.isEmpty
          ? AppLocalizations.current
              .isEmpty(fieldName ?? AppLocalizations.current.field)
          : null;
}
