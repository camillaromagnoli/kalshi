import 'package:go_router/go_router.dart';
import 'package:kalshi/core/routes/app_route_paths.dart';
import 'package:kalshi/features/financial_wellness/domain/entities/wellness_score_entity.dart';
import 'package:kalshi/features/financial_wellness/presentation/pages/financial_wellness_score_form_page.dart';
import 'package:kalshi/features/financial_wellness/presentation/pages/financial_wellness_score_result_page.dart';

final appRoutes = <GoRoute>[
  GoRoute(
    path: AppRoutePaths.financialWellnessFormPath,
    builder: (context, state) {
      return FinancialWellnessScoreFormPage();
    },
  ),
  GoRoute(
    path: AppRoutePaths.financialWellnessResultPath,
    builder: (context, state) {
      final financialWellnessScoreEntity =
          state.extra as FinancialWellnessScoreEntity;
      return FinancialWellnessScoreResultPage(
        financialWellnessScoreEntity: financialWellnessScoreEntity,
      );
    },
  ),
];
