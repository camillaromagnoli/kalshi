import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/core/exceptions/exceptions.dart';
import 'package:kalshi/features/financial_wellness/domain/repositories/financial_wellness_repository.dart';
import 'package:kalshi/features/financial_wellness/presentation/cubit/financial_wellness_score_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/entities_mocks.dart';
import '../../mocks/repositories_mocks.dart';

void main() {
  late FinancialWellnessRepository financialWellnessRepositoryMock;
  late FinancialWellnessScoreCubit financialWellnessCubit;

  setUp(() {
    financialWellnessRepositoryMock = FinancialWellnessRepositoryMock();

    financialWellnessCubit = FinancialWellnessScoreCubit(
      financialWellnessScoreRepository: financialWellnessRepositoryMock,
    );
  });

  tearDown(() {
    financialWellnessCubit.close();
  });

  test('Initial state is FinancialWellnessScoreResultState', () {
    expect(financialWellnessCubit.state, FinancialWellnessScoreResultState());
  });

  group('FinancialWellnessS', () {
    blocTest<FinancialWellnessScoreCubit, FinancialWellnessScoreState>(
      'Emits [FinancialWellnessScoreLoeadingState(), FinancialWellnessScoreResultState]'
      ' when getWellnessScore is called successfully',
      build: () => financialWellnessCubit,
      act: (cubit) {
        when(
          () => financialWellnessRepositoryMock.getWellnessScore(
            monthlyCosts: 10,
            annualIncome: 1000,
          ),
        ).thenAnswer((_) async => financialWellnessScoreModelHealthy);
        cubit.getFinancialWellnessScore(monthlyCosts: 10, annualIncome: 1000);
      },
      expect:
          () => [
            FinancialWellnessScoreLoadingState(),
            FinancialWellnessScoreResultState(
              score: financialWellnessScoreModelHealthy,
            ),
          ],
    );
    blocTest<FinancialWellnessScoreCubit, FinancialWellnessScoreState>(
      'Emits [FinancialWellnessScoreLoadingState(), FinancialWellnessScoreErrorState] '
      'when getWellnessScore is called with error',
      build: () => financialWellnessCubit,
      act: (cubit) {
        when(
          () => financialWellnessRepositoryMock.getWellnessScore(
            monthlyCosts: 10,
            annualIncome: 1000,
          ),
        ).thenThrow(ServerException());

        cubit.getFinancialWellnessScore(monthlyCosts: 10, annualIncome: 1000);
      },
      expect:
          () => [
            FinancialWellnessScoreLoadingState(),
            FinancialWellnessScoreErrorState(
              failure: ServerException().message,
            ),
          ],
    );
  });
}
