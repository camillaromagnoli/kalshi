import 'package:flutter/material.dart';
import 'package:kalshi/core/design/tokens/colors.dart';

class KalshiShadows {
  KalshiShadows._();

  static BoxShadow shadowOne = BoxShadow(
    color: KalshiColors.surfaceCard,
    offset: Offset(0, 2),
    blurRadius: 10,
    spreadRadius: 0,
  );
}
