import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';

class KalshiCard extends StatelessWidget {
  const KalshiCard({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KalshiColors.surfacePure,
        boxShadow: [KalshiShadows.shadowOne],
      ),
      padding: EdgeInsets.all(KalshiSpacing.md),
      child: child,
    );
  }
}
