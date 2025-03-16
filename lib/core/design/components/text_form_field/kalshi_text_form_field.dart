import 'package:flutter/material.dart';
import 'package:kalshi/core/design/components/icon/kalshi_icon.dart';
import 'package:kalshi/core/design/components/icon/kalshi_icon_data.dart';
import 'package:kalshi/core/design/components/text/kalshi_text.dart';
import 'package:kalshi/core/design/tokens/colors.dart';
import 'package:kalshi/core/design/tokens/spacing.dart';
import 'package:kalshi/core/utils/formatters.dart';

class KalshiTextFormField extends StatelessWidget {
  const KalshiTextFormField({
    required this.label,
    this.controller,
    this.validator,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: KalshiSpacing.xxs,
      children: [
        KalshiText(
          label,
          style: KalshiTextStyles.description,
          color: KalshiColors.contentSix,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: KalshiTextStyles.headingSmall.copyWith(
            color: KalshiColors.contentThree,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [CurrencyInputFormatter()],
          decoration: InputDecoration(
            prefixIcon: KalshiIcon(
              KalshiIcons.money,
              color: KalshiColors.contentOne,
            ),
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: KalshiColors.contentTwo,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: KalshiColors.contentTwo,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
