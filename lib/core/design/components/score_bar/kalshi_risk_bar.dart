import 'package:flutter/material.dart';
import 'package:kalshi/core/design/components/score_bar/kalshi_score_bar.dart';
import 'package:kalshi/core/design/tokens/colors.dart';

enum KalshiScoreBarType { low, medium, high }

class KalshiScoreBar extends StatelessWidget {
  const KalshiScoreBar({required this.type, super.key});

  final KalshiScoreBarType type;

  @override
  Widget build(BuildContext context) {
    Color getColorByType() {
      switch (type) {
        case KalshiScoreBarType.low:
          return KalshiColors.error;
        case KalshiScoreBarType.medium:
          return KalshiColors.warning;
        case KalshiScoreBarType.high:
          return KalshiColors.success;
      }
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 84,
            height: 16,
            decoration: BoxDecoration(
              color: getColorByType(),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          ClipPath(
            clipper: KalshiScoreBarClipper(),
            child: Container(
              width: 84,
              height: 16,
              decoration: BoxDecoration(
                color:
                    type == KalshiScoreBarType.medium ||
                            type == KalshiScoreBarType.high
                        ? getColorByType()
                        : KalshiColors.contentTwo,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),

          ClipPath(
            clipper: KalshiScoreBarClipper(),
            child: Container(
              width: 84,
              height: 16,
              decoration: BoxDecoration(
                color:
                    type == KalshiScoreBarType.high
                        ? getColorByType()
                        : KalshiColors.contentTwo,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
