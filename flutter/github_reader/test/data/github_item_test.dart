import 'package:test/test.dart';
import 'package:github_reader/data/github_item.dart';

void main() {
  test('GitHubItemを生成する', () {
    var item = GitHubItem(
      id: 1,
      name: 'test',
      url: 'http://example.com',
      description: 'github item'
    );

    expect(item.id, equals(1));
  });

  test('jsonからGitHubItemを生成する', () {
    final json = {
      'id': 1,
      'name': 'test',
      'html_url': 'http"//example.com',
      'description': 'github item'
    };
    var item = GitHubItem.fromJson(json);

    expect(item.id, json['id']);
  });
}