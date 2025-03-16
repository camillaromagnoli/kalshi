import 'package:kalshi/features/financial_wellness/domain/entities/wellness_score_entity.dart';

class FinancialWellnessScoreModel extends FinancialWellnessScoreEntity {
  const FinancialWellnessScoreModel({required super.score});

  factory FinancialWellnessScoreModel.fromJson(Map<String, dynamic> json) {
    return FinancialWellnessScoreModel(
      score: FinancialWellnessScore.fromInt(json['score']),
    );
  }
}
