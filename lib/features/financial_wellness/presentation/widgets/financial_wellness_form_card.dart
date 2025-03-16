import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/core/design/design.dart';
import 'package:kalshi/core/di/injection.dart';
import 'package:kalshi/core/routes/app_route_paths.dart';
import 'package:kalshi/core/utils/formatters.dart';
import 'package:kalshi/features/financial_wellness/presentation/cubit/financial_wellness_score_cubit.dart';
import 'package:kalshi/core/utils/extensions.dart';

class FinancialWellnessFormCard extends StatefulWidget {
  const FinancialWellnessFormCard({super.key});

  @override
  State<FinancialWellnessFormCard> createState() =>
      _FinancialWellnessTestFormCardState();
}

class _FinancialWellnessTestFormCardState
    extends State<FinancialWellnessFormCard> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _annualIncomeController;
  late TextEditingController _monthlyCostsController;

  @override
  void initState() {
    _annualIncomeController = TextEditingController();
    _monthlyCostsController = TextEditingController();
    super.initState();
  }

  String? validateTextFormField({
    required String? value,
    required String requiredFieldMessage,
    required String negativeValueMessage,
  }) {
    if (value == null || value.isEmpty) {
      return requiredFieldMessage;
    }

    final parsedValue = currencyFormat.parse(value).toDouble();
    if (parsedValue <= 0) {
      return negativeValueMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FinancialWellnessScoreCubit>(),
      child: BlocConsumer<
        FinancialWellnessScoreCubit,
        FinancialWellnessScoreState
      >(
        listener: (context, state) {
          if (state is FinancialWellnessScoreResultState) {
            context.go(
              AppRoutePaths.financialWellnessResultPath,
              extra: state.score,
            );
          } else if (state is FinancialWellnessScoreErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: KalshiText(
                  context.l10n.genericError,
                  color: KalshiColors.contentPure,
                ),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<FinancialWellnessScoreCubit>();
          return Form(
            key: _formKey,
            child: KalshiCard(
              child: Column(
                spacing: KalshiSpacing.md,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(KalshiImages.logo),
                  Column(
                    children: [
                      KalshiText(
                        context.l10n.financialWellnessTestTitle,
                        style: KalshiTextStyles.headingSmall,
                      ),
                      KalshiText(
                        context.l10n.financialWellnessTestDescription,
                        textAlign: TextAlign.center,
                        style: KalshiTextStyles.paragraph,
                      ),
                    ],
                  ),
                  KalshiTextFormField(
                    label: context.l10n.financialWellnessTestAnnualIncomeLabel,
                    controller: _annualIncomeController,
                    validator: (value) {
                      return validateTextFormField(
                        value: value,
                        requiredFieldMessage: context.l10n
                            .financialWellnessTestRequiredField(
                              context
                                  .l10n
                                  .financialWellnessTestAnnualIncomeLabel,
                            ),
                        negativeValueMessage: context.l10n
                            .financialWellnessTestNonNegativeField(
                              context
                                  .l10n
                                  .financialWellnessTestAnnualIncomeLabel,
                            ),
                      );
                    },
                  ),
                  KalshiTextFormField(
                    label: context.l10n.financialWellnessTestMonthlyCostsLabel,
                    controller: _monthlyCostsController,
                    validator: (value) {
                      return validateTextFormField(
                        value: value,
                        requiredFieldMessage: context.l10n
                            .financialWellnessTestRequiredField(
                              context
                                  .l10n
                                  .financialWellnessTestMonthlyCostsLabel,
                            ),
                        negativeValueMessage: context.l10n
                            .financialWellnessTestNonNegativeField(
                              context
                                  .l10n
                                  .financialWellnessTestMonthlyCostsLabel,
                            ),
                      );
                    },
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: KalshiButton(
                      label: context.l10n.financialWellnessTestContinueButton,
                      showLoading: state is FinancialWellnessScoreLoadingState,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          cubit.getFinancialWellnessScore(
                            monthlyCosts:
                                currencyFormat
                                    .parse(_monthlyCostsController.text)
                                    .toDouble(),
                            annualIncome:
                                currencyFormat
                                    .parse(_annualIncomeController.text)
                                    .toDouble(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _annualIncomeController.dispose();
    _monthlyCostsController.dispose();
    super.dispose();
  }
}
