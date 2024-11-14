import 'package:flutter/material.dart';
import 'package:github_search_app_riverpod/common/enum/app_page.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) {
          _onNavBarTapped(context, AppPage.values[index]);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final routerDelegate = GoRouter.of(context).routerDelegate;
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    if (location == AppPage.setting.path) {
      return AppPage.setting.number;
    }
    return AppPage.home.number;
  }

  void _onNavBarTapped(BuildContext context, AppPage page) {
    switch (page) {
      case AppPage.home:
        context.go(AppPage.home.path);
        break;
      case AppPage.setting:
        context.go(AppPage.setting.path);
        break;
    }
  }
}
