import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final NumberFormat currencyFormat = NumberFormat("#,##0.00", "en_US");

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.isEmpty) {
      return newValue.copyWith(text: "");
    }

    double value = double.parse(text) / 100;
    String formattedValue = currencyFormat.format(value);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
