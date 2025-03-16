import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalshi/core/design/design.dart';
import 'package:kalshi/core/routes/app_route_paths.dart';
import 'package:kalshi/features/financial_wellness/domain/entities/wellness_score_entity.dart';
import 'package:kalshi/core/utils/extensions.dart';

class _FinancialWellnessResultCardData {
  final String title;
  final String subtitle;
  final KalshiScoreBarType scoreBar;

  _FinancialWellnessResultCardData({
    required this.title,
    required this.subtitle,
    required this.scoreBar,
  });
}

class FinancialWellnessResultCard extends StatelessWidget {
  const FinancialWellnessResultCard({required this.score, super.key});

  final FinancialWellnessScore score;

  @override
  Widget build(BuildContext context) {
    _FinancialWellnessResultCardData getCardData() {
      switch (score) {
        case FinancialWellnessScore.low:
          return _FinancialWellnessResultCardData(
            title: context.l10n.financialWellnessResultUnhealthyScoreTitle,
            subtitle:
                context.l10n.financialWellnessResultUnhealthyScoreSubtitle,
            scoreBar: KalshiScoreBarType.low,
          );
        case FinancialWellnessScore.medium:
          return _FinancialWellnessResultCardData(
            title: context.l10n.financialWellnessResultMediumScoreTitle,
            subtitle: context.l10n.financialWellnessResultMediumScoreSubtitle,
            scoreBar: KalshiScoreBarType.medium,
          );
        case FinancialWellnessScore.healthy:
          return _FinancialWellnessResultCardData(
            title: context.l10n.financialWellnessResultHealthyScoreTitle,
            subtitle: context.l10n.financialWellnessResultHealthyScoreSubtitle,
            scoreBar: KalshiScoreBarType.high,
          );
      }
    }

    final _FinancialWellnessResultCardData cardData = getCardData();

    return KalshiCard(
      child: Column(
        spacing: KalshiSpacing.xl,
        children: [
          Image.asset(KalshiImages.logo),
          KalshiScoreBar(type: cardData.scoreBar),
          Column(
            children: [
              KalshiText(
                cardData.title,
                style: KalshiTextStyles.headingSmall,
                textAlign: TextAlign.center,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: KalshiTextStyles.paragraph.copyWith(
                    color: KalshiColors.contentThree,
                  ),
                  children: [
                    TextSpan(
                      text: context.l10n.financialWellnessResultScoreSubtitle,
                    ),
                    TextSpan(
                      text: ' ${cardData.subtitle}',
                      style: KalshiTextStyles.paragraphSemibold.copyWith(
                        color: KalshiColors.contentThree,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            child: KalshiButton(
              label: context.l10n.financialWellnessResultReturnButton,
              onPressed:
                  () => context.go(AppRoutePaths.financialWellnessFormPath),
              type: KalshiButtonType.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
