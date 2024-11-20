import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_app_riverpod/common/enum/app_page.dart';

void main() {
  group('AppPage', () {
    final List<Map<String, dynamic>> testCases = [
      {
        'page': AppPage.home,
        'expectedNumber': 0,
        'expectedPath': '/',
      },
      {
        'page': AppPage.setting,
        'expectedNumber': 1,
        'expectedPath': '/setting',
      },
    ];

    for (var testCase in testCases) {
      late AppPage page;
      late int expectedNumber;
      late String expectedPath;

      setUp(() {
        page = testCase['page'];
        expectedNumber = testCase['expectedNumber'];
        expectedPath = testCase['expectedPath'];
      });

      test('${testCase['page']}:の場合正しいnumberを返すこと', () {
        expect(page.number, expectedNumber);
      });

      test('${testCase['page']}:の場合正しいpathを返すこと', () {
        expect(page.path, expectedPath);
      });
    }
  });
}
