import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app_riverpod/common/models/repository.dart';
import 'package:github_search_app_riverpod/common/provider/repository_list_notifier.dart';
import 'package:github_search_app_riverpod/common/provider/search_string_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String searchString = ref.watch(searchStringProvider);
    final List<Repository> repositories = ref.watch(repositoryListProvider(searchString));
    final TextEditingController textEditingController = TextEditingController(text: searchString);

    void updateSearchString(String value) {
      ref.read(searchStringProvider.notifier).state = value;
    }

    void search(String value) {
      updateSearchString(value);
      ref.read(repositoryListProvider(searchString).notifier).searchRepositories(searchString);
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
              onChanged: (value) => updateSearchString(value),
              onSubmitted: (value) {
                search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search for a repository', 
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
            Expanded(
              child: repositories.isEmpty
                ? const Center(child: Text('No repositories found'))
                : ListView.builder(
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      final repository = repositories[index];
                      return ListTile(
                        title: Text(repository.name),
                        subtitle: Text(repository.ownerName),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
