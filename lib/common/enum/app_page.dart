enum AppPage { home, setting }

extension AppPageExtension on AppPage {
  int get number {
    switch (this) {
      case AppPage.home:
        return 0;
      case AppPage.setting:
        return 1;
    }
  }

  String get path {
    switch (this) {
      case AppPage.home:
        return '/';
      case AppPage.setting:
        return '/setting';
    }
  }
}
