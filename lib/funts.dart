
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScreenArguments {
  final String message;

  ScreenArguments(this.message);
}

// Formats money value
String? formatMoney(dynamic value, {int precision = 2}) {
  assert(precision >= 0 && precision <= 20);

  double d;
  try {
    if (value is num) {
      d = value.toDouble();
    } else {
      d = double.parse(value);
    }
  } catch (_, __) {
    return value;
  }
  var money = (d).toStringAsFixed(precision);

  money = money.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
  return money;
}


String formatNairaString(value, {int precision = 2}) {
  return '₦${formatMoney(value, precision: precision)}';
}

Widget formatNaira(
  dynamic value, {
  String prefix = '',
  String suffix = '',
  TextStyle? style,
  TextStyle? symbolStyle,
  int precision = 2,
  bool isObscure = false
}) {
  return RichText(
    text: TextSpan(
      children: [
        if (prefix != null && prefix.isNotEmpty)
          TextSpan(text: prefix, style: style),
        TextSpan(
            text: '₦',
            style: (symbolStyle ?? style)!.copyWith(fontFamily: 'arial')),
        TextSpan(
          text: '${formatMoney(value, precision: precision)}',
          style: style,
        ),
        if (suffix != null && suffix.isNotEmpty)
          TextSpan(text: suffix, style: style)
      ],
    ),
  );
}

Widget formatDollars(
  dynamic value, {
  String prefix = '',
  String suffix = '',
  TextStyle? style,
  TextStyle? symbolStyle,
  int precision = 2,
  bool isObscure = false
}) {
  return RichText(
    text: TextSpan(
      children: [
        if (prefix != null && prefix.isNotEmpty)
          TextSpan(text: prefix, style: style),
        TextSpan(
            text: "\$",
            style: (symbolStyle ?? style)!.copyWith(fontFamily: 'satoshi')),
           const TextSpan(text: " "),
        TextSpan(
          text: '${formatMoney(value, precision: precision)}',
          style: style,
        ),
        if (suffix != null && suffix.isNotEmpty)
          TextSpan(text: suffix, style: style)
      ],
    ),
  );
}
