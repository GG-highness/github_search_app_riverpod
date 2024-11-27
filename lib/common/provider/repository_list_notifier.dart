import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search_app_riverpod/common/client/github_client.dart';
import 'package:github_search_app_riverpod/common/models/repository.dart';

// レポジトリの状態管理用クラス
class RepositoryListNotifier extends StateNotifier<List<Repository>> {
  RepositoryListNotifier(this._client) : super([]);

  final GitHubApiClient _client;

  Future<void> searchRepositories(String query) async {
    final repositories = await _client.searchRepositories(query);
    state = repositories;
  }
}

// レポジトリリストのプロバイダーを.familyで定義
final repositoryListProvider = StateNotifierProvider.family<RepositoryListNotifier, List<Repository>, String>((ref, query) {
  final client = ref.watch(gitHubApiClientProvider);
  return RepositoryListNotifier(client)..searchRepositories(query);
});
