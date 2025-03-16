import 'package:injectable/injectable.dart';
import 'package:kalshi/core/exceptions/exceptions.dart';
import 'package:kalshi/features/financial_wellness/data/models/wellness_score_model.dart';
import 'package:kalshi/features/financial_wellness/domain/repositories/financial_wellness_repository.dart';
import 'package:kalshi/features/financial_wellness/domain/services/financial_wellness_service.dart';

@Injectable(as: FinancialWellnessRepository)
class FinancialWellnessRepositoryImpl extends FinancialWellnessRepository {
  final FinancialWellnessService _service;

  FinancialWellnessRepositoryImpl({required FinancialWellnessService service})
    : _service = service;
  @override
  Future<FinancialWellnessScoreModel> getWellnessScore({
    required double monthlyCosts,
    required double annualIncome,
  }) async {
    try {
      final response = await _service.calculateScore(
        monthlyCosts: monthlyCosts,
        annualIncome: annualIncome,
      );

      return FinancialWellnessScoreModel.fromJson(response['data']);
    } on FinancialWellnessException catch (e) {
      if (e.statusCode == 400) {
        throw NetworkException();
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
