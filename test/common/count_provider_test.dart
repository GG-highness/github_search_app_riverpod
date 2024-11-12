import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_app_riverpod/common/provider/count_provider.dart';

void main() {
  group('counterProvider', () {
    test('初期値が0であること', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // 初期値が0であることを確認
      expect(container.read(counterProvider), 0);
    });

    test('インクリメントが正常に行われること', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(counterProvider.notifier).state++;

      expect(container.read(counterProvider), 1);
    });
  });
}
