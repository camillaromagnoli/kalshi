import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class GoRouterMock extends Mock implements GoRouter {}

pumpWidgetWithMaterialApp(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en')],
      home: Scaffold(body: widget),
    ),
  );
}

pumpWidgetWithMaterialAppRouter(
  WidgetTester tester,
  Widget widget,
  String path,
  String initialLocation,
) async {
  final goRouter = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(path: path, builder: (context, state) => Scaffold(body: widget)),
    ],
  );

  await tester.pumpWidget(
    MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en')],
    ),
  );
}
