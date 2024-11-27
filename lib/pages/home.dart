import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app_riverpod/common/provider/search_string_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchString = ref.watch(searchStringProvider);
    final TextEditingController textEditingController = TextEditingController(text: searchString);

    void search() {
      // 検索時にプロバイダーの値を使用
      print('Searching for: $searchString');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textEditingController,
              onChanged: (value) => ref.read(searchStringProvider.notifier).state = value,
              onSubmitted: (value) {
                ref.read(searchStringProvider.notifier).state = value;
                search();
              },
              decoration: const InputDecoration(
                labelText: 'Search for a repository', 
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
          ],
        ),
      ),
    );
  }
}
