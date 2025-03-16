part of 'financial_wellness_score_cubit.dart';

sealed class FinancialWellnessScoreState extends Equatable {}

final class FinancialWellnessScoreResultState
    extends FinancialWellnessScoreState {
  final FinancialWellnessScoreEntity? score;

  FinancialWellnessScoreResultState({this.score});

  FinancialWellnessScoreResultState copyWith({
    required FinancialWellnessScoreEntity? score,
  }) {
    return FinancialWellnessScoreResultState(score: score ?? this.score);
  }

  @override
  List<Object?> get props => [score];

  @override
  bool? get stringify => true;
}

final class FinancialWellnessScoreLoadingState
    extends FinancialWellnessScoreState {
  FinancialWellnessScoreLoadingState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

final class FinancialWellnessScoreErrorState
    extends FinancialWellnessScoreState {
  FinancialWellnessScoreErrorState({required this.failure});

  final String failure;

  @override
  List<Object?> get props => [failure];

  @override
  bool? get stringify => true;
}
