import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';

enum KalshiCircularProgressIndicatorType { primary, secondary }

class KalshiCircularProgressIndicator extends StatelessWidget {
  const KalshiCircularProgressIndicator({
    this.type = KalshiCircularProgressIndicatorType.primary,
    super.key,
  });

  final KalshiCircularProgressIndicatorType type;

  Color getColorByType() {
    switch (type) {
      case KalshiCircularProgressIndicatorType.primary:
        return KalshiColors.brandSecondary;
      case KalshiCircularProgressIndicatorType.secondary:
        return KalshiColors.contentPure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: getColorByType());
  }
}
