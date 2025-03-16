abstract class FinancialWellnessService {
  Future<Map<String, dynamic>> calculateScore({
    required double monthlyCosts,
    required double annualIncome,
  });
}
