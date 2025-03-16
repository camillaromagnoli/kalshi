import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:kalshi/core/design/components/components.dart';
import 'package:kalshi/core/routes/app_route_paths.dart';
import 'package:kalshi/features/financial_wellness/presentation/cubit/financial_wellness_score_cubit.dart';
import 'package:kalshi/features/financial_wellness/presentation/pages/financial_wellness_score_form_page.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/cubit_mocks.dart';
import '../../mocks/utils.dart';

void main() {
  final FinancialWellnessScoreCubit financialWellnessCubitMock =
      FinancialWellnessCubitMock();

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();

    whenListen(
      financialWellnessCubitMock,
      Stream.fromIterable([
        FinancialWellnessScoreResultState(),
        FinancialWellnessScoreResultState(),
      ]),
      initialState: FinancialWellnessScoreResultState(),
    );
  });

  setUpAll(() {
    GetIt.I.registerFactory<FinancialWellnessScoreCubit>(
      () => financialWellnessCubitMock,
    );
  });

  testWidgets('Find Annual Income TextField and enter text', (
    WidgetTester tester,
  ) async {
    await pumpWidgetWithMaterialAppRouter(
      tester,
      BlocProvider<FinancialWellnessScoreCubit>.value(
        value: financialWellnessCubitMock,
        child: FinancialWellnessScoreFormPage(),
      ),
      AppRoutePaths.financialWellnessFormPath,
      AppRoutePaths.financialWellnessFormPath,
    );
    final annualIncomeTextField = find.byWidgetPredicate(
      (widget) =>
          widget is KalshiTextFormField && widget.label == "Annual Income",
    );
    expect(annualIncomeTextField, findsOneWidget);

    await tester.enterText(annualIncomeTextField, '1000');

    await tester.pumpAndSettle();
  });

  testWidgets('Find Monthly Costs TextField and enter text', (
    WidgetTester tester,
  ) async {
    await pumpWidgetWithMaterialAppRouter(
      tester,
      BlocProvider<FinancialWellnessScoreCubit>.value(
        value: financialWellnessCubitMock,
        child: FinancialWellnessScoreFormPage(),
      ),
      AppRoutePaths.financialWellnessFormPath,
      AppRoutePaths.financialWellnessFormPath,
    );

    final monthlyCostsTextField = find.byWidgetPredicate(
      (widget) =>
          widget is KalshiTextFormField && widget.label == "Monthly Costs",
    );
    expect(monthlyCostsTextField, findsOneWidget);

    await tester.enterText(monthlyCostsTextField, '10');

    await tester.pumpAndSettle();
  });

  testWidgets('Should tap button and navigate', (WidgetTester tester) async {
    when(
      () => financialWellnessCubitMock.getFinancialWellnessScore(
        monthlyCosts: any(named: 'monthlyCosts'),
        annualIncome: any(named: 'annualIncome'),
      ),
    ).thenAnswer((_) async => {});

    await pumpWidgetWithMaterialAppRouter(
      tester,
      BlocProvider<FinancialWellnessScoreCubit>.value(
        value: financialWellnessCubitMock,
        child: FinancialWellnessScoreFormPage(),
      ),
      AppRoutePaths.financialWellnessFormPath,
      AppRoutePaths.financialWellnessFormPath,
    );

    final button = find.byType(KalshiButton);
    expect(button, findsOneWidget);

    await tester.tap(button);

    await tester.pumpAndSettle();

    // verify(
    //   () => financialWellnessCubitMock.getFinancialWellnessScore(
    //     monthlyCosts: 10,
    //     annualIncome: 1000,
    //   ),
    // ).called(1);
  });
}
