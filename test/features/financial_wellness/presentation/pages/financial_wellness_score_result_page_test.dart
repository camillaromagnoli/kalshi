import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/core/design/components/score_bar/kalshi_risk_bar.dart';
import 'package:kalshi/features/financial_wellness/presentation/pages/financial_wellness_score_result_page.dart';
import 'package:kalshi/features/financial_wellness/presentation/widgets/security_card_widget.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/entities_mocks.dart';
import '../../mocks/utils.dart';

void main() {
  setUp(() {
    registerFallbackValue(financialWellnessScoreEntityLow);
    registerFallbackValue(financialWellnessScoreEntityMedium);
    registerFallbackValue(financialWellnessScoreEntityHealthy);
  });

  testWidgets('Should render the healthy score bar', (tester) async {
    await pumpWidgetWithMaterialApp(
      tester,
      FinancialWellnessScoreResultPage(
        financialWellnessScoreEntity: financialWellnessScoreEntityHealthy,
      ),
    );

    await tester.pumpAndSettle();

    final securityCard = find.byWidgetPredicate(
      (widget) =>
          widget is KalshiScoreBar && widget.type == KalshiScoreBarType.high,
    );

    expect(securityCard, findsOneWidget);
  });

  testWidgets('Should render the medium score bar', (tester) async {
    await pumpWidgetWithMaterialApp(
      tester,
      FinancialWellnessScoreResultPage(
        financialWellnessScoreEntity: financialWellnessScoreEntityMedium,
      ),
    );

    await tester.pumpAndSettle();

    final securityCard = find.byWidgetPredicate(
      (widget) =>
          widget is KalshiScoreBar && widget.type == KalshiScoreBarType.medium,
    );

    expect(securityCard, findsOneWidget);
  });

  testWidgets('Should render the low score bar', (tester) async {
    await pumpWidgetWithMaterialApp(
      tester,
      FinancialWellnessScoreResultPage(
        financialWellnessScoreEntity: financialWellnessScoreEntityLow,
      ),
    );
    await tester.pumpAndSettle();

    final securityCard = find.byWidgetPredicate(
      (widget) =>
          widget is KalshiScoreBar && widget.type == KalshiScoreBarType.low,
    );

    expect(securityCard, findsOneWidget);
  });

  testWidgets('Should render one security card widget', (tester) async {
    await pumpWidgetWithMaterialApp(
      tester,
      FinancialWellnessScoreResultPage(
        financialWellnessScoreEntity: financialWellnessScoreEntityHealthy,
      ),
    );
    await tester.pumpAndSettle();

    final securityCard = find.byType(SecurityCardWidget);

    expect(securityCard, findsOneWidget);
  });
}
