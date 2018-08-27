import 'dart:convert';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:github_reader/data/github_repository.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  test('GitHubItemのリストを取得する', () async {
    final mockItem = [{
      'id': 1,
      'name': 'item',
      'http_url': 'example.com',
      'description': 'description'
    }];
    final client = MockClient();
    when(client.get(GitHubRepository.baseUrl + '/repositories'))
      .thenAnswer((_) async => http.Response(json.encode(mockItem), 200));

    final repository = GitHubRepository(client);
    expect(await repository.fetchItems(), hasLength(1));
  });
}