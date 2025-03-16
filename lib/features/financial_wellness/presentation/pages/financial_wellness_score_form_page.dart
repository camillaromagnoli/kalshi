import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';
import 'package:kalshi/core/utils/extensions.dart';
import 'package:kalshi/features/financial_wellness/presentation/widgets/financial_wellness_form_card.dart';
import 'package:kalshi/features/financial_wellness/presentation/widgets/security_card_widget.dart';

class FinancialWellnessScoreFormPage extends StatefulWidget {
  const FinancialWellnessScoreFormPage({super.key});

  @override
  State<FinancialWellnessScoreFormPage> createState() =>
      _FinancialWellnessScoreFormPageState();
}

class _FinancialWellnessScoreFormPageState
    extends State<FinancialWellnessScoreFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Image.asset(KalshiImages.logoName),
        centerTitle: true,
      ),
      backgroundColor: KalshiColors.surfacePure,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(KalshiSpacing.md),
        child: SingleChildScrollView(
          child: Column(
            spacing: KalshiSpacing.lg,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: KalshiTextStyles.subtitle.copyWith(
                    color: KalshiColors.brandSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: context.l10n.financialWellnessFormTitlePart1,
                    ),
                    TextSpan(
                      text: context.l10n.financialWellnessFormTitlePart2,
                      style: KalshiTextStyles.subtitleSemibold,
                    ),
                  ],
                ),
              ),
              FinancialWellnessFormCard(),
              SecurityCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
