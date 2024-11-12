import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common/valueObject/route_path.dart';

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
          _onNavBarTapped(context, index);
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

    if (location == settingRoute.path) {
      return 1;
    }
    return 0;
  }

  void _onNavBarTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(homeRoute.path);
        break;
      case 1:
        context.go(settingRoute.path);
        break;
    }
  }
}
