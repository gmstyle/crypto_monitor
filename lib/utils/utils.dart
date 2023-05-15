import 'package:intl/intl.dart';

class Utils {
  static String formatCurrency(String value) {
    final doubleValue = double.parse(value);
    return NumberFormat.simpleCurrency(locale: 'en_US').format(doubleValue);
  }

  static String roundToDecimalPlaces(String value, int decimalPlaces) {
    final doubleValue = double.parse(value);
    return doubleValue.toStringAsFixed(decimalPlaces);
  }
}
