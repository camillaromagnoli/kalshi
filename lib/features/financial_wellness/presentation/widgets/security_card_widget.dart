import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';
import 'package:kalshi/core/utils/extensions.dart';

class SecurityCardWidget extends StatelessWidget {
  const SecurityCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KalshiSpacing.md),
      child: Column(
        spacing: 16,
        children: [
          KalshiIcon(KalshiIcons.lock, color: KalshiColors.contentFive),
          KalshiText(
            context.l10n.securityCardText,
            color: KalshiColors.contentFour,
            style: KalshiTextStyles.description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
