import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:github_search_app_riverpod/common/enum/app_page.dart';
import 'package:github_search_app_riverpod/widgets/scaffold_with_nav_bar.dart';

void main() {
  testWidgets('正しい表示がされていること', (WidgetTester tester) async {
    // context.go機能を提供するためのダミーのGoRouterを設定
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: AppPage.home.path,
          builder: (context, state) => ScaffoldWithNavBar(child: Container()),
        ),
        GoRoute(
          path: AppPage.setting.path,
          builder: (context, state) => ScaffoldWithNavBar(child: Container()),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    ));

    // ボトムナビゲーションバーのアイテムが表示されていることを確認
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('ページ推移テスト', (WidgetTester tester) async {
    // context.go機能を提供するためのダミーのGoRouterを設定
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: AppPage.home.path,
          builder: (context, state) => ScaffoldWithNavBar(child: Container(key: const Key('homePage'))),
        ),
        GoRoute(
          path: AppPage.setting.path,
          builder: (context, state) => ScaffoldWithNavBar(child: Container(key: const Key('settingPage'))),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    ));

    // 'Settings' をタップ
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    // 設定ページが表示されていることを確認
    expect(find.byKey(const Key('settingPage')), findsOneWidget);

    // 'Home' をタップ
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    // ホームページが表示されていることを確認
    expect(find.byKey(const Key('homePage')), findsOneWidget);
  });
}
