import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/core/exceptions/exceptions.dart';
import 'package:kalshi/features/financial_wellness/data/models/wellness_score_model.dart';
import 'package:kalshi/features/financial_wellness/data/repositories/financial_wellness_repository_impl.dart';
import 'package:kalshi/features/financial_wellness/domain/repositories/financial_wellness_repository.dart';
import 'package:kalshi/features/financial_wellness/domain/services/financial_wellness_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/entities_mocks.dart';
import '../../mocks/service_mocks.dart';

void main() {
  late FinancialWellnessService financialWellnessServiceMock;
  late FinancialWellnessRepository financialWellnessRepository;

  setUp(() async {
    financialWellnessServiceMock = FinancialWellnessServiceMock();
    financialWellnessRepository = FinancialWellnessRepositoryImpl(
      service: financialWellnessServiceMock,
    );
  });
  group('Financial Wellness Calculate Score Tests', () {
    test('Should return an instance of FinancialWellnessScoreModel '
        'when the method is called succefully', () async {
      when(
        () => financialWellnessServiceMock.calculateScore(
          monthlyCosts: 10,
          annualIncome: 1000,
        ),
      ).thenAnswer(
        (_) async => {
          'status': 200,
          'message': 'Success',
          'data': {'score': 2},
        },
      );

      final FinancialWellnessScoreModel result =
          await financialWellnessRepository.getWellnessScore(
            annualIncome: 1000,
            monthlyCosts: 10,
          );

      expect(result, financialWellnessScoreModelHealthy);
    });
    test('Should throw a ServerException when the error is unknown', () async {
      when(
        () => financialWellnessServiceMock.calculateScore(
          monthlyCosts: 10,
          annualIncome: 1000,
        ),
      ).thenThrow((_) async => Exception());

      expect(
        () async => await financialWellnessRepository.getWellnessScore(
          annualIncome: 1000,
          monthlyCosts: 10,
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
