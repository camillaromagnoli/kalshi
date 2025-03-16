import 'package:flutter/material.dart';
import 'package:kalshi/core/design/tokens/font_family.dart';
part 'kalshi_text_styles.dart';

class KalshiText extends StatelessWidget {
  const KalshiText(
    this.text, {
    this.textAlign,
    this.style,
    this.color,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle = KalshiTextStyles.description;
    return Text(
      text,
      textAlign: textAlign,
      style:
          style?.copyWith(color: color) ??
          defaultTextStyle.copyWith(color: color),
    );
  }
}
