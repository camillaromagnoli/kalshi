import 'package:injectable/injectable.dart';
import 'package:kalshi/core/exceptions/exceptions.dart';
import 'package:kalshi/features/financial_wellness/domain/services/financial_wellness_service.dart';

@Injectable(as: FinancialWellnessService)
class FinancialWellnessServiceImpl extends FinancialWellnessService {
  @override
  Future<Map<String, dynamic>> calculateScore({
    required double monthlyCosts,
    required double annualIncome,
  }) async {
    try {
      if (annualIncome <= 0 || monthlyCosts <= 0) {
        throw FinancialWellnessException(
          'Annual Income and Monthly Costs must be greater than 0.',
          400,
        );
      }
      const double tax = 0.08;
      final double netIncome = annualIncome - (annualIncome * tax);
      final double annualCost = monthlyCosts * 12;

      final double costPercentage = (annualCost / netIncome) * 100;

      int score;
      if (costPercentage <= 25) {
        score = 2;
      } else if (costPercentage <= 75) {
        score = 1;
      } else {
        score = 0;
      }

      await Future.delayed(Duration(seconds: 1));

      return {
        'status': 200,
        'message': 'Success',
        'data': {'score': score},
      };
    } on FinancialWellnessException catch (e) {
      if (e.statusCode == 400) {
        return {'status': 400, 'message': e.message, 'data': null};
      }
      return {
        'status': e.statusCode,
        'message': 'An unexpected error occurred: ${e.toString()}',
        'data': null,
      };
    } catch (e) {
      return {
        'status': 500,
        'message': 'An unexpected error occurred: ${e.toString()}',
        'data': null,
      };
    }
  }
}
