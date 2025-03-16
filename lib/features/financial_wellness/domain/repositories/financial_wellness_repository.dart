import 'package:kalshi/features/financial_wellness/data/models/wellness_score_model.dart';

abstract class FinancialWellnessRepository {
  Future<FinancialWellnessScoreModel> getWellnessScore({
    required double monthlyCosts,
    required double annualIncome,
  });
}
