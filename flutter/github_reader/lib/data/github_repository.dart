import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_reader/data/github_item.dart';

class GitHubRepository {
  static final String baseUrl = 'https://api.github.com';
  final http.Client client;

  GitHubRepository(this.client);

  Future<List<GitHubItem>> fetchItems() async {
    var res = await client.get(baseUrl + '/repositories');
    var parsed = json.decode(res.body);

    return parsed.map<GitHubItem>((json) => GitHubItem.fromJson(json)).toList();
  }
}