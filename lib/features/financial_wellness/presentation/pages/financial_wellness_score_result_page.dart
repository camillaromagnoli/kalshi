import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';
import 'package:kalshi/features/financial_wellness/domain/entities/wellness_score_entity.dart';
import 'package:kalshi/features/financial_wellness/presentation/widgets/financial_wellness_result_card.dart';
import 'package:kalshi/features/financial_wellness/presentation/widgets/security_card_widget.dart';
import 'package:kalshi/core/utils/extensions.dart';

class FinancialWellnessScoreResultPage extends StatefulWidget {
  const FinancialWellnessScoreResultPage({
    required this.financialWellnessScoreEntity,
    super.key,
  });

  final FinancialWellnessScoreEntity financialWellnessScoreEntity;

  @override
  State<FinancialWellnessScoreResultPage> createState() =>
      _FinancialWellnessScoreResultPageState();
}

class _FinancialWellnessScoreResultPageState
    extends State<FinancialWellnessScoreResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KalshiColors.surfacePure,
        title: Image.asset(KalshiImages.logoName),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(KalshiSpacing.md),
        child: Column(
          spacing: KalshiSpacing.lg,
          children: [
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: KalshiTextStyles.subtitle.copyWith(
                    color: KalshiColors.brandSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: context.l10n.financialWellnessResultTitlePart1,
                    ),
                    TextSpan(
                      text: context.l10n.financialWellnessResultTitlePart2,
                      style: KalshiTextStyles.subtitleSemibold,
                    ),
                  ],
                ),
              ),
            ),
            FinancialWellnessResultCard(
              score: widget.financialWellnessScoreEntity.score,
            ),
            SecurityCardWidget(),
          ],
        ),
      ),
    );
  }
}
