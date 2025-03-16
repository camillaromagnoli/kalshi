import 'package:equatable/equatable.dart';

enum FinancialWellnessScore {
  low(0),
  medium(1),
  healthy(2);

  final int value;

  const FinancialWellnessScore(this.value);

  static FinancialWellnessScore fromInt(int response) {
    return FinancialWellnessScore.values.firstWhere(
      (status) => status.value == response,
      orElse: () => throw ArgumentError('Invalid response value'),
    );
  }
}

class FinancialWellnessScoreEntity extends Equatable {
  final FinancialWellnessScore score;

  const FinancialWellnessScoreEntity({required this.score});

  @override
  List<Object?> get props => [score];
}
