import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  final RegExp _allowedCharacters = RegExp(r'[a-zA-Z0-9@\-\.]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    String filteredText = '';

    for (int i = 0; i < newText.length; i++) {
      if (_allowedCharacters.hasMatch(newText[i])) {
        filteredText += newText[i];
      }
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}
