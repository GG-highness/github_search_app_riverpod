import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app_riverpod/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:github_search_app_riverpod/pages/home.dart';
import 'package:github_search_app_riverpod/pages/setting.dart';
import 'common/valueObject/route_path.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: homeRoute.path,
    routes: [
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: homeRoute.path,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: settingRoute.path,
            builder: (context, state) => const SettingPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
