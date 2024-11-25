import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/github_repository.dart';

class GitHubApiClient {
  final String baseUrl = 'https://api.github.com';

  Future<List<Repository>> searchRepositories(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/repositories?q=$query'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['items'] as List)
          .map((item) => Repository.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
